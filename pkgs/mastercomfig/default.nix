pkgs:
let
  version = "9.10.2";
in
{
  addons = import ./addons pkgs version;
  presets = import ./presets pkgs version;
}
