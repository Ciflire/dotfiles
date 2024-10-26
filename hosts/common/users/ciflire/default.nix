{pkgs,config, configVars,configLib, ...}: {
  home-manager.users.${configVars.username} = import (
      configLib.relativeToRoot "home/${configVars.username}/${config.networking.hostName}.nix"
    );

  users.users.ciflire = {
    isNormalUser = true;
    description = "Léo VESSE";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      git
      helix
      lazygit
      kitty
      discord
      neovim
    #  thunderbird
    ];
  };

}
