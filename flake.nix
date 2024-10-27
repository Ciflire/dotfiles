{
  description = "The new flake config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypridle.url = "github:hyprwm/hypridle";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";
    hyprsunset.url = "github:hyprwm/hyprsunset";


    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {self, nixpkgs, ...}@inputs: 
  let 
    inherit (self) outputs;
    system = "x86_64-linux";
    inherit (nixpkgs) lib;
    configVars = import ./vars {inherit inputs lib;};
    configLib = import ./lib {inherit lib;};
    specialArgs = {
        inherit
          inputs
          outputs
          configVars
          configLib
          nixpkgs
          ;
      };
  in
  {
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    overlays = import ./overlays {inherit inputs outputs;};
    nixosConfigurations = {
      vivobook14 = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          inputs.home-manager.nixosModules.home-manager
          {home-manager.extraSpecialArgs = specialArgs;}
          ./hosts/vivobook14
        ];
      };
    };
    devShells.${system}.default = 
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in 
    pkgs.mkShell {
      packages = with pkgs; [
        nixd
      ];
    };
  };
}
