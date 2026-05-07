{
  pkgs,
  osConfig,
  self,
  ...
}:
{

  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "nh os switch /home/ciflire/dotfiles -u";
      upgrade = "nh os switch /home/ciflire/dotfiles";
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

    cntr

    nufmt

    pre-commit

    # ltex-ls-plus
  ];

}
