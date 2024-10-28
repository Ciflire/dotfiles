{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = lib.mkForce "MonoLisa";
      size = lib.mkForce 13;
    };
  };
}
