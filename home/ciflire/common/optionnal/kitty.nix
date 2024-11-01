{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = lib.mkForce "MonoLisa Variable";
      size = lib.mkForce 13;
    };
  };
}
