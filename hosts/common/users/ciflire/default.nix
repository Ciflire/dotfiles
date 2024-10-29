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
    (pkgs.callPackage ../../../../pkgs/monolisa.nix { })
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
    ];
    shell = pkgs.zsh;
  };

}
