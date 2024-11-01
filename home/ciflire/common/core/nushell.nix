{ pkgs, ... }:
{

  programs.nushell = {
    enable = true;
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
    };
  };

  home.packages = with pkgs; [
    bat
    bat-extras.batman

    pre-commit

    zellij
  ];

}
