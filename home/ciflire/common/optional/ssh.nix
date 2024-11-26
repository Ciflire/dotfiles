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
        host = "telecomnancy.net";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/tnnet"
        ];
      };

    };

  };
}
