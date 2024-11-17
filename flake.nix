{
  description = "The new flake config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";

    hyprcursor.url = "github:hyprwm/hyprcursor";
    hypridle.url = "github:hyprwm/hypridle";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpanel.url = "github:jas-singhfsu/hyprpanel";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";

    helix.url = "github:helix-editor/helix";
    stylix.url = "github:danth/stylix?rev=762c07ee10b381bc8e085be5b6c2ec43139f13b0";

    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    walker.url = "github:abenz1267/walker";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit lib; };
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
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
      packages.${system} =
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      nixosConfigurations = {
        vivobook14 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            { home-manager.extraSpecialArgs = specialArgs; }
            { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
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
            nixfmt-rfc-style
          ];
        };
    };
}
