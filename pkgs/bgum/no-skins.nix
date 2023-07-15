{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-skins";
  inherit version;

  filename = "no_skins.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/releases/download/${version}/${filename}";
    sha256 = "sha256-WJwcbmiLEvuSsfd8lkD6Pbq4igYAoveAlhKcHhjhsQE=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
