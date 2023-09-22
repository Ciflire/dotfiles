{ config, pkgs, ... }:

{
  # Enable TWM hyprland
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    dunst # notification system
    wireplumber # sound
    polkit # authentication agent
    waybar # status bar
    swww # wallpaper
    wl-clipboard # clipboard
    wofi # app launchers
    eww-wayland # status bar
    swaylock-effects # Screenlock
    wlogout # logout manager
    playerctl
    # screenshots
    jq
    slurp
    grim
    sway
    swappy
    zathura # PDF viewer
    brightnessctl
    arandr
    xournalpp
    gitkraken
    xfce.thunar
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
