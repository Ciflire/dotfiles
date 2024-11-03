{ inputs, pkgs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in
{

  imports = [
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hyprcursor.nix
    ./wlogout.nix
    ./xdg-desktop-portals.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    xwayland.enable = true;
    settings = {
      animation = [
        "windowsIn, 1,2,windowIn, slide bottom"
        "windowsOut,1,2,windowOut, slide bottom"
        "windowsMove,1,2,windowMove, slide"
        "workspaces, 1, 3, workspace, slide"
      ];
      bezier = [
        "windowIn, 0.27,0.1,0,1"
        "windowOut, 1,0,0.73,0.9"
        "windowMove, 0.3,0,0.7,1"
        "workspace, 0.53,0.02,0.69,1"
      ];
      blurls = [ "top-bar" ];
      # general = {
      #   border_size = 2;
      #   gaps_in = 3;
      #   gaps_out = 7;

      # };
      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1;
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
        };
      };
      general = {
        border_size = 0;
        gaps_in = 4;
        gaps_out = 7;
      };
      "$mod" = "SUPER";
      "$menu" = "walker";
      "exec-once" = [
        "hyprpanel &"
        "systemctl --user start hyprpolkitagent&"
        "walker --gapplication-service&"
        "wl-paste --type text --watch cliphist store #Stores only text data&"
        "wl-paste --type image --watch cliphist store #Stores only image data &"
      ];
      source = [
        "./monitors.conf"
        "./workspaces.conf"
        "./hyprland_test.conf"
      ];
      env = [
        "HYPRCURSOR_THEME, rose-pine-cursor"
        "HYPRCURSOR_SIZE, 28"
      ];
      debug.disable_logs = false;
      bind = [
        "$mod, Return, exec,kitty"
        "$mod, D,exec, $menu"
        "$mod, F, fullscreen,"
        "$mod, Q, killactive, "
        "$mod, E, exec, thunar"
        "$mod, W, exec, $menu"
        "$mod, B, exec, librewolf"
        "$mod SHIFT, V, togglefloating, "
        "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        # "$mod, P, cycleprev"
        # "$mod, J, cyclenext"
        "$mod SHIFT, L, exec, loginctl lock-session"
        "$mod, S, exec, spotify"
        "$mod, T, exec, thunderbird"
        "$mod, escape, exec, wlogout"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, J, movefocus, u"
        "$mod, K, movefocus, d"

        "$mod, ampersand, workspace, 1"
        "$mod, eacute, workspace, 2"
        "$mod, quotedbl, workspace, 3"
        "$mod, apostrophe, workspace, 4"
        "$mod, parenleft, workspace, 5"
        "$mod, minus, workspace, 6"
        "$mod, egrave, workspace, 7"
        "$mod, underscore, workspace, 8"
        "$mod, ccedilla, workspace, 9"
        "$mod, agrave, workspace, 10"

        "$mod SHIFT, ampersand, movetoworkspace, 1"
        "$mod SHIFT, eacute, movetoworkspace, 2"
        "$mod SHIFT, quotedbl, movetoworkspace, 3"
        "$mod SHIFT, apostrophe, movetoworkspace, 4"
        "$mod SHIFT, parenleft, movetoworkspace, 5"
        "$mod SHIFT, minus, movetoworkspace, 6"
        "$mod SHIFT, egrave, movetoworkspace, 7"
        "$mod SHIFT, underscore, movetoworkspace, 8"
        "$mod SHIFT, ccedilla, movetoworkspace, 9"
        "$mod SHIFT, agrave, movetoworkspace, 10"

        ''$mod , print, exec, grimblast --freeze save area - | satty -f -''
        ''$mod SHIFT, print, exec, grimblast --freeze save active screen - | satty -f -''
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      binde = [
        " , XF86MonBrightnessUp, exec, brightnessctl set +5%"
        " , XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
      bindle = [
        " , XF86KbdBrightnessUp, exec, brightnessctl -d asus::kbd_backlight set +1"
        " , XF86KbdBrightnessDown, exec, brightnessctl -d asus::kbd_backlight set 1-"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl prev"
      ];
      cursor = {
        no_hardware_cursors = true;
      };

      input = {
        kb_layout = "fr";
      };

      windowrulev2 = [
        "float, class:^(xdg-desktop-portal)"
        "idleinhibit, class:(steam_app)"
        "float, class:^(satty)$"
        "float, size 500 700 ,title:^.*Bitwarden.*$"
        "opacity 0.9 override 0.8 override 0.95 override,class:^(kitty)$"
      ];
      layerrule = [ "blur, top-bar" ];
    };
  };

  home.packages = with pkgs; [
    inputs.hyprsunset.packages.${pkgs.system}.default
    inputs.hyprsysteminfo.packages.${pkgs.system}.default
    inputs.hyprpolkitagent.packages.${pkgs.system}.default
    inputs.hyprpanel.packages.${pkgs.system}.default
    nwg-displays
  ];
}
