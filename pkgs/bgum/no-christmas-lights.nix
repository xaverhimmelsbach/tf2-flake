{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-christmas-lights";
  inherit version;

  filename = "no_christmas_lights.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-wzBP0FtwVUKShFghNR4pyn1+oJz9P1561ougTKxN59w=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
