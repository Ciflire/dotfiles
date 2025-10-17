{ inputs, pkgs, ... }:
{
  imports = [ inputs.elephant.homeManagerModules.default ];
  # programs.walker = {
  #   enable = true;
  #   package = pkgs.walker;
  #   # runAsService = true;

  #   # All options from the config.json can be used here.
  #   config = {
  #     ui = {
  #       fullscreen = true;
  #       width = 800;
  #       anchors = {
  #         top = true;
  #         bottom = true;
  #       };
  #     };
  #     list = {
  #       height = 500;
  #     };
  #     websearch.prefix = "?";
  #     switcher.prefix = "/";
  #     search = {
  #       placeholder = "Search";

  #     };
  #   };

  # };
  programs.elephant = {
    enable = true;
  };
  home.packages = with pkgs; [
    inputs.walker.packages.${pkgs.system}.default
    libqalculate
    inputs.elephant.packages.${pkgs.system}.default
  ];
}
