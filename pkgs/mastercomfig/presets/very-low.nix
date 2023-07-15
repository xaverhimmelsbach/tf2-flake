{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "very-low";
  inherit version;

  filename = "mastercomfig-very-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-fSMNjE6xSE9xtyGRxcCqmdIWFvfs0kWtA7EL7YxAdIA=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
