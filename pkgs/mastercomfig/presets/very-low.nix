{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "very-low";
  inherit version;

  filename = "mastercomfig-very-low-preset.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/mastercomfig/mastercomfig/releases/download/${version}/${filename}";
    sha256 = "sha256-faGnju5aPovl++kAh2HNkkroUoMz9/Fx6kSgb3IBRfg=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
