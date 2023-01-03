{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium-low";
  inherit version;

  filename = "mastercomfig-medium-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-/P1QasA9gIcxzTYk1xB2ufQ75xRxi04iDAAa1NHkDjQ=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
