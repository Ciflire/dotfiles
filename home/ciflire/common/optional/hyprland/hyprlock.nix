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
        disable_loading_bar = false;
        grace = 0;
        hide_cursor = true;
      };
      background = {
        path = lib.mkForce "~/.config/hypr/wallpapers/forrest.png";
        blur_passes = 3;
        blur_size = 8;
      };
      input-field = {
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = lib.mkForce "rgb(202, 211, 245)";
        inner_color = lib.mkForce "rgb(91, 96, 120)";
        outer_color = lib.mkForce "rgb(24, 25, 38)";
        outline_thickness = 5;
        placeholder_text = lib.mkForce "\'Password...\' ";
        shadow_passes = 2;
      };
    };
  };
}
