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

  fonts.fontDir.enable = true;

  fonts.packages = [
    pkgs.monolisa
  ];

  users.users.ciflire = {
    isNormalUser = true;
    description = "Léo VESSE";
    extraGroups = [
      "networkmanager"
      "wheel"
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
