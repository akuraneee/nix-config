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

  outputs = { self, nixpkgs, home-manager, helium,   ... }@inputs:
    let
      mkHost = host: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/common.nix
          ./hosts/${host}/configuration.nix
          ({ pkgs, ... }: {
            environment.systemPackages = import ./packages.nix { inherit pkgs inputs host; };
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.akurane = import ./home.nix;
          }
        ];
      };
    in
    {
      nixosConfigurations = {
        nixos = mkHost "pc";
        laptop = mkHost "laptop";
      };
    };
}
