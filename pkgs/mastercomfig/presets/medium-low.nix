{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium-low";
  inherit version;

  filename = "mastercomfig-medium-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-P9Zk9IZVpX1hkAcdpNvKfzP2P+TDPNRwwv4I8uM+WU4=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
