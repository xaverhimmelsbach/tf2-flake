pkgs:
let
  version = "v2.0";
in
{
  nhcustom2 = import ./nhcustom2.nix pkgs;
  no-hats = import ./no-hats.nix pkgs version;
  no-bugged-misc = import ./no-bugged-misc.nix pkgs version;
  no-hats-creatorstf = import ./no-hats-creatorstf.nix pkgs version;
  no-unusuals = import ./no-unusuals.nix pkgs version;
  no-christmas-lights = import ./no-christmas-lights.nix pkgs version;
  no-skins = import ./no-skins.nix pkgs version;
  no-botkiller = import ./no-botkiller.nix pkgs version;
  no-zombie-skins = import ./no-zombie-skins.nix pkgs version;
}
