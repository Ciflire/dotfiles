{ inputs, pkgs, ... }:
{
  programs.walker = {
    enable = true;
    package = inputs.walker.packages.${pkgs.system}.default;
    # runAsService = true;

    # All options from the config.json can be used here.
    config = {
      ui = {
        fullscreen = true;
        width = 800;
        anchors = {
          top = true;
          bottom = true;
        };
      };
      list = {
        height = 500;
      };
      websearch.prefix = "?";
      switcher.prefix = "/";
      search = {
        placeholder = "Search";

      };
    };

  };
  home.packages = with pkgs; [
    inputs.walker.packages.${pkgs.system}.default
  ];
}
