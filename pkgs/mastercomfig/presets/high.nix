{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "high";
  inherit version;

  filename = "mastercomfig-high-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-704aEg1Gyl5vI6Y6VTmlUEiP70PjrF6/VlxsrkkepWs=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
