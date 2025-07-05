# *.nix
{
  config,
  # inputs,
  # self,
  ...
}:
{
  # imports = [
  #   inputs.hyprpanel.homeManagerModules.hyprpanel
  # ];

  programs.hyprpanel = {
    enable = true;
    # hyprland.enable = true;
    # overwrite.enable = true;
    # overlay.enable = true;

    settings = {
      layout = {
        "bar.layouts" = {
          "*" = {
            "left" = [
              "dashboard"
              "workspaces"
              "windowtitle"
            ];
            "middle" = [
              "media"
            ];
            "right" = [
              "volume"
              "battery"
              "clock"
              "network"
              "bluetooth"
              "hypridle"
              "hyprsunset"
              "systray"
              "notifications"
            ];
          };
        };
      };
      bar = {
        autoHide = "never";
        battery = {
          scrollUp = "brightnessctl set +5%";
          scrollDown = "brightnessctl set 5%-";
        };

        bluetooth = {
          label = false;
        };
        clock = {
          format = "%I:%M:%S %p";
        };
        customModules = {
          hypridle = {
            label = false;
          };
          hyprsunset = {
            label = false;
            temperature = "4000k";
          };
          netstat.dynamicIcon = false;
          ram = {
            icon = "";
          };
          updates = {
            leftClick = "$TERMINAL -e /nix/store/qlj85mm1kyzh0ksvl32d4jfq3sh8s0na-hyprpanel/share/scripts/runUpdates.sh -arch";
            pollingInterval = 21600000;
            updateCommand = "/nix/store/qlj85mm1kyzh0ksvl32d4jfq3sh8s0na-hyprpanel/share/scripts/checkUpdates.sh -arch";
          };
        };
        launcher = {
          icon = "";
        };
        network = {
          label = false;
        };
        notifications = {
          show_total = true;
          hideCountWhenZero = false;
        };
        volume = {
          scrollUp = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
          scrollDown = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          rightClick = "wpctl set-mute @DEFAULT_SINK@ toggle";
        };
        windowtitle.truncation_size = 50;
        workspaces = {
          show_icons = false;
          showApplicationIcons = false;
          showWsIcons = true;
          applicationIconOncePerWorkspace = true;
          showAllActive = true;
          monitorSpecific = false;
          workspaces = 7;
          workspaceIconMap = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "󰊴";
            "6" = "";
            "7" = "";
          };
        };
      };
      menus = {
        dashboard.powermenu.avatar.image = "~/.face.icon";
        dashboard.shortcuts.left.shortcut1.icon = "󰇩";
        dashboard.shortcuts.left.shortcut1.command = "microsoft-edge-stable";
        dashboard.shortcuts.left.shortcut3.icon = "";
        dashboard.shortcuts.left.shortcut2.command = "spotify-launcher";
        dashboard.shortcuts.left.shortcut1.tooltip = "Microsoft Edge";
        dashboard.shortcuts.left.shortcut4.command = "rofi -show drun";
        dashboard.shortcuts.left.shortcut3.command = "discord";
        dashboard.directories.enabled = true;
        clock.weather.interval = 15000;
        clock.weather.unit = "metric";
        clock.weather.location = "Nancy";
        clock.weather.key = config.sops.secrets.weather_api_key.path;
        power.lowBatteryThreshold = 20;
        volume.raiseMaximumVolume = true;
        dashboard.shortcuts.right.shortcut3.command =
          "bash -c \"/nix/store/qlj85mm1kyzh0ksvl32d4jfq3sh8s0na-hyprpanel/share/scripts/snapshot.sh\"";
      };

      theme = {
        name = "catppuccin_macchiato";
        font = {
          size = "16px";
          name = "MonoLisaVariable Nerd Font";
        };
        bar.transparent = true;
      };

    };
  };
}
