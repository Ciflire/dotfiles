{ inputs, pkgs, ... }:
{

  services.hyprpaper = {
    enable = false;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2;
      wallpaper = [
        {
          monitor = "";
          path = "/home/ciflire/.config/hypr/wallpapers";
          timeout = 3600;
        }
      ];

    };
  };
  home.file.".config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };
}
