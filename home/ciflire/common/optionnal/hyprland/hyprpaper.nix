{inputs, pkgs, ...}:{

services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.hyprpaper;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2.0;
      preload = [ "/home/ciflire/nixFlake/home/hyprland/wallpapers/landscapes/forrest.png" ];
      # preload = [ "/home/ciflire/nixFlake/home/hyprland/wallpapers/2825710.gif" ];

      wallpaper = [ ",/home/ciflire/nixFlake/home/hyprland/wallpapers/landscapes/forrest.png" ];

    };
  };
  }
