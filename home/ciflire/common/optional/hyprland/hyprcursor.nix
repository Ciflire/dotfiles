{ inputs, pkgs, ... }:
{
  home.sessionVariables = {
    HYPRCURSOR_THEME = "catppuccin-mocha-dark";
    HYPRCURSOR_SIZE = 24;
  };
  home.packages = with pkgs; [
    inputs.nixpkgs-master.legacyPackages.${pkgs.system}.catppuccin-cursors.mochaDark
  ];
}
