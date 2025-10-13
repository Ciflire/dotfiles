{
  lib,
  pkgs,
  inputs,
  config,
  configVars,
  configLib,
  ...
}:
{
  home-manager.users.${configVars.username} = import (
    configLib.relativeToRoot "home/${configVars.username}/${config.networking.hostName}.nix"
  );

  sops.secrets.ciflire_password.neededForUsers = true;
  users.mutableUsers = false;

  environment.sessionVariables = {
    FLAKE = "$HOME/dotfiles";
    SHELL = "nu";
    TERM = "kitty";
    TERMINAL = "kitty";
    VISUAL = "hx";
    EDITOR = "hx";
    MANPAGER = "batman"; # see ./cli/bat.nix
    NIXOS_OZONE_WL = "1";
    # QT_STYLE_OVERRIDE = "adwaita-dark";
    # QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";

  };

  users.users.ciflire = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.ciflire_password.path;
    description = "Léo VESSE";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
      "gamemode"
      "libvirtd"
    ];
    packages = with pkgs; [
      git
      # helix
      lazygit
      lsd
      kitty
      discord
      neovim
      openconnect
      thunderbird
      # walker
      wl-clipboard
    ];
    shell = pkgs.nushell;
  };

}
