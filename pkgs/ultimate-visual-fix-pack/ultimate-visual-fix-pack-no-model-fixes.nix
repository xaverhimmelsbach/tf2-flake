{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "ultimate-visual-fix-pack-no-model-fixes";
  inherit version;

  filename000 = "TF2UltimateVisualFix_noModelFixes_000.vpk";
  src000 = pkgs.fetchurl {
    url = "https://github.com/agrastiOs/Ultimate-TF2-Visual-Fix-Pack/releases/download/${version}/${filename000}";
    sha256 = "sha256-wO8iSA79T346hqRvdOLdiMRov5c/Jc4ERO2DEame9zc=";
  };

  filenameDir = "TF2UltimateVisualFix_noModelFixes_dir.vpk";
  srcDir = pkgs.fetchurl {
    url = "https://github.com/agrastiOs/Ultimate-TF2-Visual-Fix-Pack/releases/download/${version}/${filenameDir}";
    sha256 = "sha256-Lgzgnu1Os/w+6jX3XO9PITVsCamy9MZPkItc2CA/+Wc=";
  };

  outputs = [
    # Default output, contains dir vpk
    "out"
    # Additional output, contains 000 vpk
    "vpk_000"
  ];

  buildCommand = ''
    mkdir -p $out
    mkdir -p $vpk_000
    # Write vpk files and filenames to use in tf2/custom folder
    cp $srcDir $out/out.vpk
    echo "$filenameDir" > $out/filename
    cp $src000 $vpk_000/out.vpk
    echo "$filename000" > $vpk_000/filename
  '';
}
