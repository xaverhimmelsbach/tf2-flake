{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "low";
  inherit version;

  filename = "mastercomfig-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-WREA0U8LH4MOsyhrCosUkXlZZSXtcX1Z1WyRIzn9tM4=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
