{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-botkiller";
  inherit version;

  filename = "no_botkiller.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-gkxKzOB1lH32lFt++rG/9+EZZCGVwZ3RU1AuSRmCqCE=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
