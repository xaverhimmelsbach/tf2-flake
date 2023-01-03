{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "lowmem";
  inherit version;

  filename = "mastercomfig-lowmem-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-6zSvvTqpEIso7SeRt0jwz+P8cHA4cSGF7ek1zqUnwxw=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
