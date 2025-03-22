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
    configFile = {
      text = ''
        $env.config.show_banner = false
        $env.config.edit_mode = 'vi'
        mkdir ($nu.data-dir | path join "vendor/autoload")
        starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

        fastfetch
      '';
    };
  };

  home.packages = with pkgs; [
    bat
    bat-extras.batman

    nufmt

    pre-commit

    ltex-ls-plus
  ];

}
