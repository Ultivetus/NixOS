# flake.nix
{
  description = "Ultivetus's NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-uconsole.url = "github:nixos-uconsole/nixos-uconsole";
    nixos-uconsole.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-uconsole, home-manager, ... }@inputs: {
    nixosConfigurations = {
      ultivetus-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/apps/default.nix
          ./hosts/ultivetus-desktop/configuration.nix
          ./modules/core/locale.nix
          ./modules/core/network.nix
          ./modules/core/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ultivetus = import ./home/ultivetus.nix;
            home-manager.users.guest = import ./home/guest.nix;
          }
        ];
      };
      ultivetus-uconsole = nixos-uconsole.lib.mkUConsoleSystem {
        variant = "cm5";
        modules = [
          ./modules/apps/default.nix
          ./hosts/ultivetus-uconsole/configuration.nix
          ./modules/core/locale.nix
          ./modules/core/network.nix
          ./modules/core/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ultivetus = import ./home/ultivetus.nix;
            home-manager.users.guest = import ./home/guest.nix;
          }
        ];
      };
    };
  };
}