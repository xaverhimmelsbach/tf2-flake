{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-soundscapes";
  inherit version;

  filename = "mastercomfig-no-soundscapes-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-Qp7QW9zZXpX7zrK+Fmpf428lU7Mc86sMn6+5Syhnxz0=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
