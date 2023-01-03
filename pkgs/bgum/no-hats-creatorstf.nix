{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-hats-creatorstf";
  inherit version;

  filename = "no_hats_creatorstf.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-VLBLZR/C2CvWdeloFxvN2AyU/IqNDLnNLRvhaXV9ZR4=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
