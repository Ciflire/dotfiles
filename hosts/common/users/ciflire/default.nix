{
  pkgs,
  config,
  configLib,
  ...
}:
{
  home-manager.users."ciflire" = import (
    configLib.relativeToRoot "home/ciflire/${config.networking.hostName}.nix"
  );

  imports = [

  ];

  # sops.secrets.ciflire_password.neededForUsers = true;
  # users.mutableUsers = false;

  environment.sessionVariables = {
    FLAKE = "$HOME/dotfiles";
    TERM = "kitty";
    TERMINAL = "kitty";
    VISUAL = "hx";
    EDITOR = "hx";
    MANPAGER = "batman"; # see ./cli/bat.nix
    NIXOS_OZONE_WL = "1";
    GRIMBLAST_EDITOR = "satty";
    # QT_STYLE_OVERRIDE = "adwaita-dark";
    # QT_QPA_PLATFORMTHEME = "hyprqt6engine";
  };

  users.users.ciflire = {
    isNormalUser = true;
    # hashedPasswordFile = config.sops.secrets.ciflire_password.path;
    description = "Léo VESSE";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
      "gamemode"
      "libvirtd"
      "hbase"
    ];
    packages = with pkgs; [
      git
      openconnect
      logitech-udev-rules
    ];
  };

}
