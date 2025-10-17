{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;
    settings = {
      general = {
        hide_cursor = true;
      };

      background = lib.mkForce [
        {
          path = "screenshot";
          blur_passes = 3;
        }
      ];

      image = lib.mkForce [
        {
          path = "/home/ciflire/Pictures/pp/classic_circle.png";
          # position = 0,-200
          zindex = 1;
        }
      ];

      input-field = lib.mkForce [
        {
          outline_thickness = 10;
          size = "160, 160";
          hide_input = true;
          placeholder_text = "";
          fail_text = "";
        }
      ];

      label = lib.mkForce [
        {
          text = "$TIME";
          halign = "center";
          valign = "center";
          position = "0,-110";
          font_family = "MonoLisaVariable Nerd Font Mono";
          font_size = 20;
        }
        {
          text = "$USER";
          position = "0, 110";
          font_family = "MonoLisaVariable Nerd Font Mono";
          font_size = 20;

        }
      ];
    };
  };
}
