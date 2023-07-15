{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "high";
  inherit version;

  filename = "mastercomfig-high-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-c+JeBDGamXjrhjPz78+N9k3Z0S8sY2E+Ts+KV1cqZFo=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
