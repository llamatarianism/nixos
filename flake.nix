{
  inputs = {
    nixpkgs.url    = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    hjem           = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf            = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    microfetch.url = "github:notashelf/microfetch/543a1597baf680762bdf72e33efe1e267ad6a847";
    umbriel.url    = "github:noctalia-dev/umbriel/cachix";
    limusic.url    = "github:arch-fan/nur-packages";
    nordend.url    = "github:pankaspe/nordend-fm";
    xremap.url     = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, home-manager, nvf, ...  }@inputs: 
  let
    lib = nixpkgs.lib;
    importTree = import ./import-tree.nix { inherit lib; };
  in
  {
    packages.x86_64-linux.my-neovim =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nvf/nvf.nix ];
      }).neovim;

    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ({pkgs, ...}: {
          environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.my-neovim ];
        })
        inputs.hjem.nixosModules.default
	    ]
      ++ importTree ./sys
      ++ importTree ./hjem;
    };
  };
}
