{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-hats-bgum";
  inherit version;

  filename = "no_hats_bgum.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/releases/download/${version}/${filename}";
    sha256 = "sha256-6usHrckmqkZHBE6O0jpQmORPQxrEwR1bEAvaWRHzors=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
