{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    nodejs_23

    svelte-language-server
    vscode-langservers-extracted
    typescript-language-server
    nodePackages_latest.svelte-check
    nodePackages_latest.prettier
    emmet-language-server
  ];
}
