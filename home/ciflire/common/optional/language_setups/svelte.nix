{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_23

    svelte-language-server
    nodePackages_latest.prettier
  ];
}
