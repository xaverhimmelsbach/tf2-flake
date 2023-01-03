pkgs:
let
  version = "9.10.1";
in
{
  addons = import ./addons pkgs version;
  presets = import ./presets pkgs version;
}
