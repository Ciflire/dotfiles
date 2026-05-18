{ pkgs, ... }:
{
  services.wayle = {
    enable = true;
    package = pkgs.wayle;
    settings = {
      general = {
        font-sans = "MonoLisaVariable Nerd Font Mono";
        font-mono = "MonoLisaVariable Nerd Font Mono";
        tearing-mode = true;
      };

      styling = {
        theme-provider = "wayle";

        palette = {
          bg = "#16161e";
          fg = "#c0caf5";
          primary = "#7aa2f7";
        };
      };

      bar = {
        scale = 1;
        location = "top";
        background-opacity = 0;
        layout = [
          {
            monitor = "*";
            show = true;
            left = [
              "dashboard"
              "hyprland-workspaces"
            ];
            center = [
              "media"
            ];
            right = [
              "hyprsunset"
              "volume"
              "idle-inhibit"
              "systray"
              "clock"
              "notifications"
            ];

          }
        ];
      };

      modules = {
        clock = {
          format = "%H:%M";
          icon-show = true;
          label-show = true;
        };
        dashboard = {
          icon-override = "";
          border-show = false;
          border-color = "yellow";
          icon-color = "auto";
          icon-gb-color = "blue";
          right-click = "";
          middle-click = "";
          scroll-up = "";
          scroll-down = "";
          left-click = "dropdown:dashboard";
          dropdown-lock-command = "loginctl lock-session";
          dropdown-logout-command = ''hyprctl eval "hl.dispatch(hl.dsp.exit())"'';
          dropdown-reboot-command = "systemctl reboot";
          dropdown-poweroff-command = "systemctl poweroff";
        };

        hyprland-workspaces = {
          min-workspace-count = 7;
          monitor-specific = false;
          show-special = true;
          urgent-show = true;
          urgent-mode = "workspace";
          display-mode = "icon";
          label-use-name = false;
          numbering = "absolute";
          divider = " ";
          app-icons-show = false;
          app-icons-dedupe = true;
          app-icons-fallback = "ld-app-window-symbolic";
          app-icons-empty = "tb-minus-symbolic";
          icon-gap = 0.3;
          workspace-padding = 0.5;
          icon-size = 1.0;
          label-size = 1.0;
          workspace-ignore = [ ];
          active-indicator = "background";
          active-color = "accent";
          occupied-color = "fg-muted";
          empty-color = "fg-subtle";
          container-bg-color = "bg-surface-elevated";
          border-show = false;
          border-color = "border-default";

          workspace-map = {
            "1" = {
              icon = "si-ghostty-symbolic";
            };

            "2" = {
              icon = "si-zenbrowser-symbolic";
            };
            "3" = {
              icon = "tb-brand-vscode-symbolic";
            };
            "4" = {
              icon = "si-tidal-symbolic";
            };
            "5" = {
              icon = "si-steam-symbolic";
            };
            "6" = {
              icon = "si-discord-symbolic";
            };
            "7" = {
              icon = "si-thunderbird-symbolic";
            };
          };
        };
        hyprsunset = {
          format = "{{ status }}";
          temperature = 4000;
          gamma = 100;
          icon-off = "ld-sun-symbolic";
          icon-on = "ld-moon-symbolic";
          border-show = false;
          border-color = "yellow";
          icon-show = true;
          icon-color = "auto";
          icon-bg-color = "yellow";
          label-show = true;
          label-color = "yellow";
          label-max-length = 0;
          button-bg-color = "bg-surface-elevated";
          left-click = ":toggle";
          right-click = "";
          middle-click = "";
          scroll-up = "";
          scroll-down = "";
        };
        media = {
          icon-type = "application-mapped";
          players-ignored = [ ];
          player-priority = [ ];
          format = "{{ title }} - {{ artist }}";
          icon-name = "ld-music-symbolic";
          spinning-disc-icon = "ld-disc-3-symbolic";
          border-show = false;
          border-color = "blue";
          icon-show = true;
          icon-color = "auto";
          icon-bg-color = "blue";
          label-show = true;
          label-color = "blue";
          label-max-length = 35;
          button-bg-color = "bg-surface-elevated";
          left-click = "dropdown:media";
          right-click = "wayle media play-pause";
          middle-click = "";
          scroll-up = "";
          scroll-down = "";

          player-icons = {
            mozilla-zen = "si-zenbrowser-symbolic";
          };
        };
        notification = {
          icon-name = "ld-bell-symbolic";

        };
      };
    };
  };
}
