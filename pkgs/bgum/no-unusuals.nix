{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-unusuals";
  inherit version;

  filename = "no_unusuals.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/releases/download/${version}/${filename}";
    sha256 = "sha256-n3sFsm/Az0iaBPbkXbf3CdeED/FlW3y6wP8Ki0FVD8U=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
