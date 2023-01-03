{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "transparent-viewmodels";
  inherit version;

  filename = "mastercomfig-transparent-viewmodels-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-nsUBSsGHXM+xwecixZvhisbifLqkqSyF7kIkJFmq6ow=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
