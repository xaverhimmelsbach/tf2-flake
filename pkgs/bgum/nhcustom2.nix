{stdenv, pkgs}:
stdenv.mkDerivation rec {
  pname = "nhcustom2";
  version = "v2.1";

  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/nhcustom2/releases/download/${version}/nhcustom2_linux.zip";
    sha265 = "";
  };

  buildCommand = ''
    mkdir -p $out
    unzip $src $out
  '';
}