{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-tuna
      obs-pipewire-audio-capture
    ];
  };
}
