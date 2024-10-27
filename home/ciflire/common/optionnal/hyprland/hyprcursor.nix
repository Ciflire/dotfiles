{inputs, pkgs, ...}:{
  home.sessionVariables = {
    HYPRCURSOR_THEME = "catppuccin-mocha-dark";
    HYPRCURSOR_SIZE = 24;
  }; 
  home.packages = with pkgs; [
    catppuccin-cursors.mochaDark
  ];
}
