{ inputs, pkgs, ... }:
{
  home.sessionVariables = {
    HYPRCURSOR_THEME = "BreezeX-RosePine-Linux";
    HYPRCURSOR_SIZE = 28;
  };
  home.packages = with pkgs; [
    rose-pine-cursor
  ];
}
