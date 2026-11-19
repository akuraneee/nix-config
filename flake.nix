{
  inputs = {
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager,  ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix

	home-manager.nixosModules.home-manager

	{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.akurane =
            import ./home.nix;
        }
      ];

    };
  };
}

