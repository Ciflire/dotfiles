{ config, pkgs, ... }:
{
  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "wpa_supplicant";
  networking.wireless.userControlled.enable = true;
}
