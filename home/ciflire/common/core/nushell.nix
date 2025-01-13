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
      vpn = "sudo openconnect -u vesse1u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr";
      ls = "ls";
      ll = "ls -l";
      la = "ls -la";
      # lr = "ls -lR";
      cat = "bat";
    };
  };

  home.packages = with pkgs; [
    bat
    bat-extras.batman

    pre-commit

    ltex-ls-plus
  ];

}
