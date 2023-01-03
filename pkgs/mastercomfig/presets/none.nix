{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "none";
  inherit version;

  filename = "mastercomfig-none-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-jIMEsGu5QoFjhMPkp8pvB3S81yXAfuXZilG9JEqOLvE=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
