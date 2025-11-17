{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-tuna
      obs-vaapi
      obs-pipewire-audio-capture
    ];
  };
}
