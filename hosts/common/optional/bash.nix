{ ... }: {

  programs.bash = {
    shellAliases = {
      update = "nh os switch /home/ciflire/Projects/dotfiles -u";
      upgrade = "nh os switch /home/ciflire/Projects/dotfiles";
      vpn = "sudo openconnect -u vesse1u@etu --authgroup='Universite-de-Lorraine' vpn.univ-lorraine.fr";
    };
  };
}
