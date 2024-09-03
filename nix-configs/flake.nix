{
  description = "Jazz's Personal NixOS Configuration";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:donovanglover/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };


  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    ... 
    } @ inputs: {
    nixosConfigurations = {
      jazz-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs; };
        modules = [
	  ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jazz = import ./home-manager/home.nix;
            }
	  inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
