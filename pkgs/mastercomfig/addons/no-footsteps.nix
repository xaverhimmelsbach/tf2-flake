{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-footsteps";
  inherit version;

  filename = "mastercomfig-no-footsteps-addon.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-7WIWwV2PnwRM79I7vOdfRggQi/NUS+6GHkAAyo8ap2I=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
