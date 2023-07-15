{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "low";
  inherit version;

  filename = "mastercomfig-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-8K4JoE++skKP87CkINm7jkz+OSUZnOHKeRm+2YOZvKU=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
