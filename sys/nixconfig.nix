{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.nixPath = [
    "nixos-config=/home/lune/.config/nixos/configuration.nix"
	  "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
	  "/nix/var/nix/profiles/per-user/root/channels"
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };


  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

}
