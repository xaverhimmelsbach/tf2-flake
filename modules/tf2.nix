{ config, lib, ... }:

with lib;

let
  cfg = config.games.tf2;
in
{
  options = {
    games.tf2 = {
      enable = mkOption {
        description = "Enable tf2 config";
        type = types.bool;
        default = false;
      };

      basePath = mkOption {
        description = "Path to tf2 base directory";
        type = types.str;
        default = "";
      };

      custom = mkOption {
        description = "Custom files to install";
        type = types.listOf types.package;
      };

      cfg = {
        useOverrides = mkOption {
          description = "Write config files to the overrides subdirectory. Required if using mastercomfig";
          type = types.bool;
        };
        files = mkOption {
          description = "Config files to write to the cfg directory";
          type = types.attrsOf types.lines;
          /* fileType "TF2 cfg directory"
            # Append overrides subdirectory if applicable
            ("${homeDirectory}/${cfg.basePath}/tf/cfg/" +
            (if cfg.cfg.useOverrides then "overrides/" else "")); */
        };
      };
    };
  };

  config = mkIf (cfg.enable) {
    assertions = [
      {
        assertion = cfg.basePath != "";
        message = "basePath can not be an empty string";
      }
    ];

    # Loop over custom packages and install them to TF2's custom directory
    home.file = (builtins.foldl'
      (files: currentPackage:
        # Append current packages vpk(s) to all files
        files //
          # Loop over current packages outputs
          builtins.foldl'
            (packageFiles: currentOutput:
              let
                outputDir = currentOutput.value;
                # Read canonical filename
                filename = builtins.readFile "${outputDir}/filename";
              in
              # Add current outpus vpk to package files
              packageFiles // {
                "${cfg.basePath}/tf/custom/${filename}" = {
                  # Refer to out.vpk file that should be produced by every tf2 package output
                  source = "${outputDir}/out.vpk";
                };
              }
            )
            # Start with empty file set for package
            { }
            # Package outputs to loop over
            (attrsets.mapAttrsToList
              # Transform output into name value pair
              (name: value: { name = name; value = value; })
              # Extract outputs from package
              (attrsets.getAttrs currentPackage.outputs currentPackage)
            )
      )
      # Start with empty file set for all packages
      { }
      # Custom packages to loop over
      cfg.custom)
    # Append cfg files
    // (builtins.foldl'
      (files: currentFile:
        let
          filePath = "${cfg.basePath}/tf/cfg/" + (if cfg.cfg.useOverrides then "overrides/" else "");
        in
        files //
          {
            "${filePath}${currentFile.name}" = {
              text = currentFile.value;
            };
          })
      # Start with empty file set cfg files
      { }
      # Transform cfg files into list of name value pairs
      (attrsets.mapAttrsToList (name: value: { name = name; value = value; }) cfg.cfg.files));
  };
}
