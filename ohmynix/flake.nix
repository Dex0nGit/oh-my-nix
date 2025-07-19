{
  inputs = {

    # NIX

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    # ZEN

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # HM

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # osu!

    osu-nixos.url = "path:./osu-nixos";
    osu-nixos.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      osu-nixos,
      zen-browser,
      home-manager,
      ...
    }:

    let
      system = "x86_64-linux";

      # PKGS W/ OVERLAY

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ osu-nixos.overlay ];
        config = {
          allowUnfree = true;
        };
      };

    in
    {

      # MODULES IMPORT

      nixosConfigurations.dex = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./sys.nix
          ./pkgs.nix
          ./srvc.nix
          ./net.nix
          ./usr.nix
          ./prgrms.nix
          ./hardware-configuration.nix
        ];

        specialArgs = {

          zenBrowserBeta = zen-browser.packages.${system}.beta;
          osuLazer = osu-nixos.packages.${system}.osu-lazer;

        };
        pkgs = pkgs;
      };

      homeConfigurations = {
        dex = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
  }

