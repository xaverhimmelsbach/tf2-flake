{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-tutorial";
  inherit version;

  filename = "mastercomfig-no-tutorial-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-sA3kN2iNe5bwh+954ef+sV0hjMdMZLs6IPgsHDi5oXE=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
