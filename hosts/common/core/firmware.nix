{ pkgs, ... }:
{
  hardware.firmware = [ pkgs.linux-firmware ];

  environment.systemPackages = [ pkgs.linux-firmware ];
}
