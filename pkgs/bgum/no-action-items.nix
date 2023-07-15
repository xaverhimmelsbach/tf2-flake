{ stdenv, pkgs, ... }: version:
stdenv.mkDerivation rec {
  pname = "no-action-items";
  inherit version;

  filename = "no_action_items.vpk";
  src = pkgs.fetchurl {
    url = "https://github.com/Fedora31/no-hats-bgum/releases/download/${version}/${filename}";
    sha256 = "sha256-oPVLjC0d9vfszEMKZE7v/MswJApMvmTsj0dDRqiK55I=";
  };

  buildCommand = ''
    mkdir -p $out
    cp $src $out/out.vpk
    echo "$filename" > $out/filename
  '';
}
