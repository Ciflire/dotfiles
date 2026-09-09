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
    ../common/optional/git.nix
    ../common/optional/nh.nix
    ../common/optional/pipewire.nix
    ../common/optional/steam.nix
    ../common/optional/term_tools.nix
    ../common/optional/wireguard.nix
    ../common/optional/yubikey.nix

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  # programs.ssh.startAgent = true;

  networking.hostName = "vivobook14"; # Define your hostname.

  programs.firefox.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  system.stateVersion = "26.05"; # Did you read the comment?

}
