{ config, pkgs, ... }:
{
  imports = [
    # Core Imports
    ./core/envVars.nix
    ./core/grub.nix.nix
    ./core/hardware-configuration.nix
    ./core/localVars.nix
    ./core/nvidia.nix
    ./core/wifi.nix

    # Dev Imports
    ./dev/c.nix
    ./dev/go.nix
    ./dev/java.nix
    ./dev/lua.nix
    ./dev/nix.nix
    ./dev/python.nix
    ./dev/rust.nix
    ./dev/typst.nix
    ./dev/web.nix

    # Home Imports
    ./home.nixu jeu constitue une défaite, et selon les règles, il faut 

    # Hyprland configuration
    ./hyprland.nix

    ./networkTools.nix
    ./nvidia.nix
    ./utils.nix
    ./terminal.nix
    <home-manager/nixos>
  ];

}
