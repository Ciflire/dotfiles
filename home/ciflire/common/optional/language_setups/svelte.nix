{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    # nodePackages_latest.nodejs

    svelte-language-server
    vscode-langservers-extracted
    typescript-language-server
    # nodePackages_latest.svelte-check
    # nodePackages_latest.prettier
    emmet-language-server
  ];
}
