{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop
    fzf
    ncdu
    nix-tree
    playerctl
    pre-commit
    ripgrep
    tree
    unzip
    unrar
    wget
    zip
  ];
}
