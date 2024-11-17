{
  inputs,
  pkgs,
  osConfig,
  ...
}:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in
{
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages.${pkgs.system}.hypridle;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || ${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "${hyprland}/bin/hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 150;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 120;
          on-timeout =
            if osConfig.networking.hostName == "g713" then
              "${pkgs.brightnessctl}/bin/brightnessctl -sd asus::kbd_backlight set 0"
            else
              "";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd asus::kbd_backlight";
        }
        {
          timeout = 120;
          on-timeout = "${hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
