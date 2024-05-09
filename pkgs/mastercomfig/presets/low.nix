{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "low";
  inherit version;

  filename = "mastercomfig-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-CpIbjy1dzNCEa583DthygkIQ5aq7Wp2QOJGANC2IGNs=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
