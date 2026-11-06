{
  inputs = {
    nixpkgs.url  = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
    umbriel.url  = "github:noctalia-dev/umbriel/cachix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    limusic.url  = "github:arch-fan/nur-packages";
  };

  outputs = { self, nixpkgs, ...  }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	      ./configuration.nix
		    ./overlays.nix
	    ];
    };
  };
}
