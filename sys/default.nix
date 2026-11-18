{ ... }:
{
  imports = [
    ./boot.nix
    ./environment.nix
    ./font.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./locale.nix
    ./microfetch.patch
    ./network.nix
    ./nixconfig.nix
    ./nsxiv.patch
    ./overlays.nix
    ./programs.nix
    ./services.nix
    ./umbriel.nix
    ./users.nix
    ./xdg.nix
    ./xremap.nix
  ];
}
