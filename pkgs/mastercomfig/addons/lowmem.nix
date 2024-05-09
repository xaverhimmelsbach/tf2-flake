{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "lowmem";
  inherit version;

  filename = "mastercomfig-lowmem-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-21iyJ4Zg+p5qES05FP2fMO7/p3YrrIkNp2GM2oEjT4E=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
