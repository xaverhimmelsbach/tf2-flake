{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-soundscapes";
  inherit version;

  filename = "mastercomfig-no-soundscapes-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-a1//MSddZM9Luj4qIDS9woT5adTLFRYDr9KtoD/1i5A=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
