{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamescope = {
      enable = true;
    };
  };

  environment.systemPackages = [ pkgs.protonup-qt ];
}
