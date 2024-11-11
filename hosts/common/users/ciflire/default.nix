{
  pkgs,
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

  fonts.fontDir.enable = true;

  fonts.packages = [
    pkgs.monolisa
    pkgs.font-awesome
    pkgs.roboto
    pkgs.source-sans-pro

  ];

  users.users.ciflire = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.ciflire_password.path;
    description = "Léo VESSE";
    extraGroups = [
      "networkmanager"
      "wheel"
      "plugdev"
    ];
    packages = with pkgs; [
      git
      helix
      lazygit
      kitty
      discord
      neovim
      thunderbird
      wl-clipboard
    ];
    shell = pkgs.nushell;
  };

}
