pkgs: version:
{
  disable-pyroland = import ./disable-pyroland.nix pkgs version;
  flat-mouse = import ./flat-mouse.nix pkgs version;
  lowmem = import ./lowmem.nix pkgs version;
  no-footsteps = import ./no-footsteps.nix pkgs version;
  no-soundscapes = import ./no-soundscapes.nix pkgs version;
  no-tutorial = import ./no-tutorial.nix pkgs version;
  null-canceling-movement = import ./null-canceling-movement.nix pkgs version;
  transparent-viewmodels = import ./transparent-viewmodels.nix pkgs version;
}
