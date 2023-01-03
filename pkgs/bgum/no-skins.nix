{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-skins";
  inherit version;

  filename = "no_skins.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/raw/${version}/${filename}";
    sha256 = "sha256-DpaTc2i0g0D6O/YUjTMuz1QWF6SI/s31DX8j43g2M98=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
