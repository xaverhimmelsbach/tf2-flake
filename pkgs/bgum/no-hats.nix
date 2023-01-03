{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-hats-bgum";
  inherit version;

  filename = "no_hats_bgum.vpk";
  src = pkgs.fetchurl {
    url = builtins.trace "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}" "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-YgC7xg+WJdPj38r4Hzm8ST32Za5GIh9ELdtiCtVXMa0=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
