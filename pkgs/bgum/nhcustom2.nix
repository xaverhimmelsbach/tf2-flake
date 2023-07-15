{ stdenv, pkgs, ... }:
stdenv.mkDerivation rec {
  pname = "nhcustom2";
  version = "v5";

  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/nhcustom2/releases/download/${version}/nhcustom2_linux.zip";
    sha256 = "sha256-xnEPxvatKfxgxPlbdMkuOWdDfNvb3OMXMlo1kbo5Q5A=";
  };

  buildInputs = [ pkgs.unzip ];

  buildCommand = ''
    mkdir -p $out
    unzip $src -d $out
    mv $out/nhcustom2_linux/* $out
    rm -rf $out/nhcustom2_linux
  '';
}
