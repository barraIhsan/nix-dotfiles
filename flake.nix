{
  description = "my system :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-config-nix = {
      url = "github:different-name/steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kopuz.url = "github:temidaradev/kopuz";

    # mpv plugins
    videoclip = {
      url = "github:Ajatt-Tools/videoclip";
      flake = false;
    };
    hold-speed = {
      url = "github:AzuredBlue/hold-speed";
      flake = false;
    };
    seek-to = {
      url = "github:occivink/mpv-scripts";
      flake = false;
    };
    thumbfast = {
      url = "github:po5/thumbfast";
      flake = false;
    };
    visualizer = {
      url = "github:mfcc64/mpv-scripts";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            inputs.steam-config-nix.nixosModules.default
            ./hosts/nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                extraSpecialArgs = {
                  inherit inputs;
                };
                sharedModules = [
                  inputs.nixcord.homeModules.nixcord
                  inputs.plasma-manager.homeModules.plasma-manager
                ];
                users.barra = import ./home/barra.nix;
              };
            }
          ];
        };
      };
    };
}
