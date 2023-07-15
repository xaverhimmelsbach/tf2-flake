{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium-low";
  inherit version;

  filename = "mastercomfig-medium-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-QBjTIY+qR4YFQ6P6wmc5bkR29RGBPvK4yp39GVJN5kA=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
