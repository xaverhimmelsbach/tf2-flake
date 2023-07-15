{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "ultra";
  inherit version;

  filename = "mastercomfig-ultra-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-cwiyLMiHbLftYazt8Yv27Cj9LK7Gs+1s3EYbjfJ62Jc=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
