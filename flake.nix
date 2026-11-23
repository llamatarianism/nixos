{
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    microfetch = {
      url = "github:notashelf/microfetch/543a1597baf680762bdf72e33efe1e267ad6a847";
      flake = false;
    };
    umbriel.url = "github:noctalia-dev/umbriel/cachix";
    nordend = {
      url = "github:pankaspe/nordend-fm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nvf, ...  }@inputs: 
  let
    lib = nixpkgs.lib;
    importTree = import ./import-tree.nix { inherit lib; };
  in
  {
    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        inputs.hjem.nixosModules.default
        inputs.nvf.nixosModules.default
	    ]
      ++ importTree ./sys;
    };
  };
}
