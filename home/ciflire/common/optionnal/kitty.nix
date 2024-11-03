{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = lib.mkForce "MonoLisaVariable Nerd Font";
      size = lib.mkForce 13;
    };
  };
}
