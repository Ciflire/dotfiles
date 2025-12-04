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
          "~/.ssh/github"
        ];
      };
      "gitlab" = {
        host = "gitlab.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/gitlab"
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
          "~/.ssh/agamotto"
        ];
      };

      "gibson" = {
        host = "gibson.telecomnancy.univ-lorraine.fr";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/gibson"
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
          "~/.ssh/tnnet"
        ];
      };

    };

  };
}
