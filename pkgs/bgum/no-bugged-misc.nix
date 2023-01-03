{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-bugged-misc";
  inherit version;

  filename = "no_bugged_misc.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-OvOoMmjy+zP8pkKvSvjEZpwSKFNyHqwG3OKzDtClu4k=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
