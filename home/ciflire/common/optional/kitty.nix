{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = lib.mkForce "MonoLisaVariable Nerd Font";
      size = lib.mkForce 13;
    };
    settings = {
      allow_remote_control = "yes";
      enabled_layouts = "tall";
    };
  };
}
