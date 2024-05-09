{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium";
  inherit version;

  filename = "mastercomfig-medium-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-yEcxPkU/0vJn7vy3n2ViYdTCBV3O9gX57fMQQZYlm3I=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
