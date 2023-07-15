{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "medium-high";
  inherit version;

  filename = "mastercomfig-medium-high-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-qpZ1ZM41LYH3/PvMH57VNbXn3/l79EuFiswDcdBzLM8=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
