{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "mauve";
      font = "MonoLisaVariable Nerd Font Mono";
      fontSize = "9";
      loginBackground = true;
    })
  ];

  services.displayManager.defaultSession = "hyprland";

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-macchiato-mauve";
    package = pkgs.kdePackages.sddm;
    settings = { };
  };
}
