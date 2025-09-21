{
  description = "The new flake config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";

    # nixpkgs-review.url = "github:RossComputerGuy/nixpkgs/feat/zig-0.14";

    hyprcursor.url = "github:hyprwm/hyprcursor";
    hypridle.url = "github:hyprwm/hypridle";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    # hyprpanel.url = "github:ciflire/hyprpanel";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprsysteminfo.url = "github:hyprwm/hyprsysteminfo";

    # helix.url = "github:helix-editor/helix";
    helix.url = "github:ciflire/helix/steel-event-system";
    steel.url = "github:mattwparas/steel";

    ghostty.url = "github:ghostty-org/ghostty";

    stylix.url = "github:danth/stylix";

    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    # walker.url = "github:abenz1267/walker";
    # elephant.url = "github:abenz1267/elephant";
  };

  outputs =
    {
      self,
      nixpkgs,
      # nixpkgs-review,
      nixpkgs-master,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit lib; };
      specialArgs = {
        inherit
          self
          inputs
          outputs
          configVars
          configLib
          nixpkgs
          ;
      };
    in
    # unstableOverlay = final: prev: {
    #   review = import nixpkgs-review {
    #     system = "x86_64-linux";
    #     config.allowUnfree = true;
    #   };nixosConfigurations =
    # };
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
      packages.${system} =
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        # master-pkgs = nixpkgs-master.legacyPackages.${system};
        import ./pkgs {
          inherit
            pkgs
            # master-pkgs
            ;
        };
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
            {
              nixpkgs.overlays = [
                # inputs.hyprpanel.overlay
                # unstableOverlay

              ];
            }
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
