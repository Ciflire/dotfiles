{inputs, pkgs, ...}:{
  programs.yazi = {
    enable = true;    
    package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.yazi;
  };

  xdg.configFile."yazelix/yazi" = {
    source = ./config;
    recursive = true;
  };
}

