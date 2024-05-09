{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "ultra";
  inherit version;

  filename = "mastercomfig-ultra-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-VfSFxRuZtYLuNrtX6X7BEMtL6wMbFyela7zbmZurlCw=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
