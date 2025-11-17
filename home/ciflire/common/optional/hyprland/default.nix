{ inputs, pkgs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
in
{

  # Import bitwarden fix script
  xdg.dataFile."scripts/bitwarden.sh".source = (import ./scripts/bitwarden.nix pkgs);

  imports = [
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprpanel.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hyprcursor.nix
    ./wlogout.nix
    ./xdg-desktop-portals.nix
  ];

  wayland.windowManager.hyprland = {
    systemd.enable = false;
    enable = true;
    package = hyprland;
    xwayland.enable = true;
    settings = {
      # ecosystem = {
      #   enforce_permissions = true;
      # };
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
        # "hyprpanel &"
        "uwsm app -- systemctl --user start hyprpolkitagent&"
        "elephant&"
        "uwsm app -- walker --gapplication-service&"
        "uwsm app -- wl-paste --type text --watch cliphist store #Stores only text data&"
        "uwsm app -- wl-paste --type image --watch cliphist store #Stores only image data &"
        "uwsm app -- systemctl --user start hyprpolkitagent&"
        "uwsm app -- $HOME/.local/share/scripts/bitwarden.sh"
        "uwsm app -- hyprsunset"
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
        "$mod, Return, exec, ghostty"
        "$mod, D,exec, $menu"
        "$mod, F, fullscreen,"
        "$mod, Q, killactive, "
        "$mod, N, exec, uwsm app -- nemo"
        "$mod, W, exec, uwsm app -- $menu -m windows"
        "$mod, C, exec, uwsm app -- $menu -m calc"
        "$mod, E, exec, uwsm app -- $menu -m emojis"
        "$mod SHIFT, T, exec, uwsm app -- $menu -m todo"
        "$mod, B, exec, uwsm app -- librewolf"
        "$mod SHIFT, V, togglefloating, "
        "SUPER, V, exec, uwsm app -- $menu -m clipboard"
        # "$mod, P, cycleprev"
        # "$mod, J, cyclenext"
        "$mod SHIFT, L, exec, uwsm app -- loginctl lock-session"
        "$mod, S, exec, uwsm app -- spotify"
        "$mod, T, exec, uwsm app -- thunderbird"
        "$mod, escape, exec, uwsm app -- wlogout"

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

        ''$mod , print, exec, grim -g "$(slurp -d)" - | satty -f -''
        # ''$mod SHIFT, print, exec, grimblast --freeze save active screen - | satty -f -''
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
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      cursor = {
        no_hardware_cursors = true;
      };

      input = {
        kb_layout = "fr";
        # kb_options = "grp:win_space_toggle";
      };

      windowrulev2 = [
        "float, class:^(xdg-desktop-portal)"
        "idleinhibit, class:(steam_app)"
        "float, class:^(satty)$"
        "opacity 0.9 override 0.8 override 0.95 override,class:^(kitty)$"
      ];
      layerrule = [ "blur, top-bar" ];

      permission = [
        "${pkgs.discord}/bin/discord, screencopy, allow"
      ];
    };
  };

  home.packages = with pkgs; [
    inputs.hyprsunset.packages.${pkgs.system}.default
    # inputs.hyprsysteminfo.packages.${pkgs.system}.default
    inputs.hyprpolkitagent.packages.${pkgs.system}.default
    # inputs.hyprpanel.packages.${pkgs.system}.default
    inputs.hyprpaper.packages.${pkgs.system}.default
    inputs.hyprpicker.packages.${pkgs.system}.default
    inputs.hyprpwcenter.packages.${pkgs.system}.default
    # nwg-displays
    jq
    socat
  ];
}
