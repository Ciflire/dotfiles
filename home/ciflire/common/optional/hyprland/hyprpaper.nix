{ inputs, pkgs, ... }:
{

  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.hyprpaper;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;
      preload = [ "~/.config/hypr/wallpapers/forrest.png" ];
      # preload = [ "/home/ciflire/nixFlake/home/hyprland/wallpapers/2825710.gif" ];

      wallpaper = [ ",~/.config/hypr/wallpapers/forrest.png" ];

    };
  };
  home.file.".config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };
}
