{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-zombie-skins";
  inherit version;

  filename = "no_zombie_skins.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-0CmxiedonO+0NEe0pBG4Z7TTaC2RycWTDHaDLSuwuls=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
