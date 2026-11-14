{
  inputs = {
    nixpkgs.url    = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    umbriel.url    = "github:noctalia-dev/umbriel/cachix";
    noctalia.url   = "github:noctalia-dev/noctalia/cachix";
    limusic.url    = "github:arch-fan/nur-packages";
    microfetch.url = "github:NotAShelf/microfetch/543a1597baf680762bdf72e33efe1e267ad6a847";
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
