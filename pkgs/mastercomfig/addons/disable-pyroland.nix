{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "disable-pyroland";
  inherit version;

  filename = "mastercomfig-disable-pyroland-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-cEFaXSXwlHwm7BnkSLmG4vAPYhL1O0XwNG0UpTnDFY8=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
