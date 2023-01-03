pkgs: version:
{
  none = import ./none.nix pkgs version;
  very-low = import ./very-low.nix pkgs version;
  low = import ./low.nix pkgs version;
  medium-low = import ./medium-low.nix pkgs version;
  medium = import ./medium.nix pkgs version;
  medium-high = import ./medium-high.nix pkgs version;
  high = import ./high.nix pkgs version;
  ultra = import ./ultra.nix pkgs version;
}
