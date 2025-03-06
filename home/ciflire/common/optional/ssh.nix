{ ... }:
{
  programs.ssh = {
    enable = true;

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
        identityFile = [
          "~/.ssh/tnnet"
        ];
      };

    };

  };
}
