{ pkgs, ... }:
{

  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "sudo nix flake update --flake /home/ciflire/dotfiles";
      upgrade = "sudo nixos-rebuild switch --flake /home/ciflire/dotfiles";
      vi = "hx";
      vim = "hx";
      nano = "hx";
      cd = "z";
    };
  };

  home.packages = with pkgs; [
    bat
    bat-extras.batman

    pre-commit

    ltex-ls-plus
  ];

}
