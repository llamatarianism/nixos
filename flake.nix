{
  inputs = {
    nixpkgs.url    = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    home-manager   = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel.url    = "github:noctalia-dev/umbriel/cachix";
    noctalia.url   = "github:noctalia-dev/noctalia/cachix";
    limusic.url    = "github:arch-fan/nur-packages";
    microfetch.url = "github:notashelf/microfetch/543a1597baf680762bdf72e33efe1e267ad6a847";
    nordend.url    = "github:pankaspe/nordend-fm";
    nvf            = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.lune = { imports = importTree ./home; };
            backupFileExtension = "bak";
          };
        }
	    ] ++ importTree ./sys;
    };
  };
}
