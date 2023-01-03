pkgs:
let
  version = "v1.0-rc3";
in
{
  ultimate-visual-fix-pack = import ./ultimate-visual-fix-pack.nix pkgs version;
  ultimate-visual-fix-pack-no-model-fixes = import ./ultimate-visual-fix-pack-no-model-fixes.nix pkgs version;
}
