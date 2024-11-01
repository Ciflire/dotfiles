{...}:{
  programs.yazi = {
    enable = true;    
  };

  xdg.configFile."yazelix/yazi" = {
    source = ./config;
    recursive = true;
  };
}

