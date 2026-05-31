{ inputs, pkgs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
in
{

  # Import bitwarden fix script
  xdg.dataFile."scripts/bitwarden.sh".source = (import ./scripts/bitwarden.nix pkgs);

  stylix.targets.hyprland.enable = true;

  imports = [
    ./hyprpaper.nix
    ./hypridle.nix
    # ./hyprpanel.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hyprcursor.nix
    ./wlogout.nix
    ./xdg-desktop-portals.nix
  ];

  wayland.windowManager.hyprland = {
    systemd.enable = true;
    enable = false;
    configType = "lua";
    package = hyprland;
    xwayland.enable = true;
  };
  home.packages = with pkgs; [
    inputs.hyprsunset.packages.${pkgs.stdenv.hostPlatform.system}.default
    # inputs.hyprsysteminfo.packages.${pkgs.system}.default
    inputs.hyprpolkitagent.packages.${pkgs.stdenv.hostPlatform.system}.default
    # inputs.hyprpanel.packages.${pkgs.system}.default
    inputs.hyprpaper.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.hyprpwcenter.packages.${pkgs.stdenv.hostPlatform.system}.default
    hyprcursor
    inputs.hyprqt6engine.packages.${pkgs.stdenv.hostPlatform.system}.default
    rose-pine-hyprcursor
    # nwg-displays
    jq
    socat
    wayle
    grimblast
    mpvpaper
  ];
}
