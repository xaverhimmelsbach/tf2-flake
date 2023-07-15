{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium";
  inherit version;

  filename = "mastercomfig-medium-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-zw1I+s7vysPnFqqG7DoNhPv6r/68dpXjwXFZqXUG64I=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
