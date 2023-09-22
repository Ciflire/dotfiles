{ config, pkgs, ... }:
{
  boot = {
    loader.grub =
      {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        configurationLimit = 25;
      };
  };
}
