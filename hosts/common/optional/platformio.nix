{ pkgs, ... }:
{

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ avrdude ];

  services.udev.packages = with pkgs; [
    platformio-core.udev
    openocd
  ];

  environment.systemPackages = with pkgs; [
    cmake
  ];

}
