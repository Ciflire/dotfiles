{ ... }:
{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks = {
      "github" = {
        host = "github.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/github_yubikey"
        ];
      };
      "gitlab" = {
        host = "gitlab.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/gitlab_yubikey"
        ];
      };
      "agamotto" = {
        host = "agamotto";
        hostname = "agamotto.telecomnancy.univ-lorraine.fr";
        user = "mirror";
        # setEnv = {
        #   TERM = "xterm-256color";
        # };
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/agamotto_yubikey"
        ];
      };

      "gibson" = {
        host = "gibson.telecomnancy.univ-lorraine.fr";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/gibson_yubikey"
        ];
      };
      "tnnet" = {
        host = "tnnet";
        hostname = "telecomnancy.net";
        identitiesOnly = true;
        user = "leov";
        setEnv = {
          TERM = "xterm-256color";
        };
        identityFile = [
          "~/.ssh/tnnet_yubikey"
        ];
      };

      "forgejo" = {
        host = "git.craplume.fr";
        identityFile = [
          "~/.ssh/id_ed25519"
        ];
      };

      "homelab" = {
        host = "homelab";
        hostname = "192.168.1.83";
        user = "homelab";
        identityFile = [
          "~/.ssh/homelab"
        ];
      };

    };

  };
}
