{...}: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij"={
    source = ./config;
    recursive = true;
  };
  
}