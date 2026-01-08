{ inputs, pkgs, ... }:
{

  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper;
    settings = {
      ipc = "on";
      splash = true;
      splash_offset = 2;
      wallpaper = [
        {
          monitor = "";
          path = "/home/ciflire/.config/hypr/wallpapers";
          timeout = 60;
        }
      ];

    };
  };
  home.file.".config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };
}
