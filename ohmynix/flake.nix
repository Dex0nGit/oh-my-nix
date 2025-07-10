{

  description = "FLAKE1";

  inputs = {
   nixpkgs = {
     url = "github:NixOS/nixpkgs/nixos-25.05";
    };
  };

  outputs = { self, nixpkgs, ... }:
 let
   lib = nixpkgs.lib;
   system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
 in {
    nixosConfigurations = {
      dex = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };

}
