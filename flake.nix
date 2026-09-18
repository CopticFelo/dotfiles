{
  description = "N's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-x86.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    acsandmann-tap = {
      url = "github:acsandmann/homebrew-tap";
      flake = false;
    };
    felixkratz-tap = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
    artginzburg-tap = {
      url = "github:artginzburg/homebrew-tap";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgs-x86,
      nix-homebrew,
      home-manager,
      homebrew-core,
      homebrew-cask,
      acsandmann-tap,
      felixkratz-tap,
      artginzburg-tap,
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Nitrogen
      darwinConfigurations."Nitrogen" = nix-darwin.lib.darwinSystem {

        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          ./pkgs.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "bak";
            home-manager.users.felo = ./home.nix;
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;

              # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
              enableRosetta = true;

              # User owning the Homebrew prefix
              user = "felo";

              # Automatically migrate existing Homebrew installations
              autoMigrate = true;

              # Optional: Declarative tap management
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "acsandmann/homebrew-tap" = acsandmann-tap;
                "FelixKratz/formulae" = felixkratz-tap;
              };
              trust = {
                formulae = [
                  "acsandmann/homebrew-tap/rift"
                  "FelixKratz/formulae/sketchybar"
                  "FelixKratz/formulae/borders"
                  "artginzburg/tap/sudo-touchid"
                ];
              };
            };
          }
        ];
      };
    };
}
