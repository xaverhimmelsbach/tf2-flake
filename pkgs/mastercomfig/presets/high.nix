{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "high";
  inherit version;

  filename = "mastercomfig-high-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-oEfi+JGsMqH4t4ozWBvKGx0hqw2ME9BbI14xlrYYDTY=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
