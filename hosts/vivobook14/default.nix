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

    (map configLib.relativeToRoot [
      #################### Required Configs ####################
      "hosts/common/core"

      #################### Host-specific Optional Configs ####################
      "hosts/common/optional/am_iot.nix"
      "hosts/common/optional/bluetooth.nix"
      "hosts/common/optional/docker.nix"
      "hosts/common/optional/gamemode.nix"
      "hosts/common/optional/gmd.nix"
      "hosts/common/optional/gpg.nix"
      "hosts/common/optional/heroic.nix"
      "hosts/common/optional/hyprland.nix"
      "hosts/common/optional/mangohud.nix"
      # "hosts/common/optional/mvsi.nix"
      "hosts/common/optional/nh.nix"
      "hosts/common/optional/nosql.nix"
      "hosts/common/optional/pipewire.nix"
      "hosts/common/optional/platformio.nix"
      "hosts/common/optional/power-profile.nix"
      # "hosts/common/optional/printing.nix"
      # "hosts/common/optional/scin.nix"
      "hosts/common/optional/steam.nix"
      "hosts/common/optional/stylix"
      # "hosts/common/optional/tni.nix"
      "hosts/common/optional/udisks.nix"
      "hosts/common/optional/upower.nix"
      "hosts/common/optional/uwsm.nix"
      # "hosts/common/optional/wacom.nix"
      "hosts/common/optional/waydroid.nix"
      "hosts/common/optional/wireguard.nix"
      "hosts/common/optional/xbox.nix"
      "hosts/common/optional/zsa.nix"

      #################### Desktop ####################
    ])

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.ssh.startAgent = true;

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
