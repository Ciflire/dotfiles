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
    ../common/core

    ../common/optional/am_iot.nix
    ../common/optional/bluetooth.nix
    ../common/optional/docker.nix
    ../common/optional/gamemode.nix
    ../common/optional/gmd.nix
    ../common/optional/gpg.nix
    ../common/optional/heroic.nix
    ../common/optional/hyprland.nix
    ../common/optional/mangohud.nix
    ../common/optional/nh.nix
    ../common/optional/nosql.nix
    ../common/optional/pipewire.nix
    ../common/optional/power-profile.nix
    ../common/optional/openrgb.nix
    ../common/optional/steam.nix
    ../common/optional/stylix
    ../common/optional/udisks.nix
    ../common/optional/upower.nix
    ../common/optional/virtmanager.nix
    ../common/optional/waydroid.nix
    ../common/optional/wireguard.nix
    ../common/optional/xbox.nix
    ../common/optional/zsa.nix

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.ssh.startAgent = true;

  networking.hostName = "corsair"; # Define your hostname.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    cachix
    gparted
    lact
    # openrgb-with-all-plugins
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

}
