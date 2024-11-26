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
      "hosts/common/optional/bluetooth.nix"
      "hosts/common/optional/hyprland.nix"
      "hosts/common/optional/steam.nix"
      "hosts/common/optional/stylix"
      "hosts/common/optional/zsa.nix"
      "hosts/common/optional/upower.nix"
      "hosts/common/optional/docker.nix"
      "hosts/common/optional/power-profile.nix"
      "hosts/common/optional/pipewire.nix"
      # "hosts/common/optional/wacom.nix"

      #################### Desktop ####################
    ])

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.ssh.startAgent = true;

  networking.hostName = "vivobook14"; # Define your hostname.

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    cachix
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

}
