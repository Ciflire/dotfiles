# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  configLib,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = lib.flatten [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Hardware
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-ssd
    inputs.hardware.nixosModules.common-cpu-amd-raphael-igpu
    inputs.hardware.nixosModules.common-cpu-amd

    ../common/core

    ../common/optional/bluetooth.nix
    ../common/optional/caddy.nix
    ../common/optional/forgejo.nix
    ../common/optional/git.nix
    ../common/optional/gpg.nix
    ../common/optional/heroic.nix
    ../common/optional/hyprland.nix
    ../common/optional/i18n.nix
    ../common/optional/jellyfin.nix
    ../common/optional/lidarr.nix
    ../common/optional/mangohud.nix
    ../common/optional/mime.nix
    # ../common/optional/nextcloud.nix
    ../common/optional/nh.nix
    ../common/optional/pipewire.nix
    ../common/optional/power-profile.nix
    ../common/optional/prowlarr.nix
    ../common/optional/qbittorrent.nix
    ../common/optional/radarr.nix
    ../common/optional/sddm.nix
    ../common/optional/seerr.nix
    ../common/optional/sonarr.nix
    ../common/optional/steam.nix
    ../common/optional/stylix
    ../common/optional/udisks.nix
    ../common/optional/upower.nix
    ../common/optional/vaultwarden.nix
    ../common/optional/virtualbox.nix
    ../common/optional/wireguard.nix
    ../common/optional/xbox.nix
    ../common/optional/yubikey.nix
    ../common/optional/zsa.nix

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # programs.ssh.startAgent = true;

  networking.hostName = "vivobook14"; # Define your hostname.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    cachix
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

}
