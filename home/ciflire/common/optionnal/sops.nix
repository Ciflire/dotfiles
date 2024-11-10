{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/ciflire/.config/sops/age/keys.txt";

    defaultSopsFile = ../../../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/gitlab" = {
        path = "/home/ciflire/.ssh/gitlab";
      };
      "private_keys/github" = {
        path = "/home/ciflire/.ssh/github";
      };
      "private_keys/gibson" = {
        path = "/home/ciflire/.ssh/gibson";
      };
    };
  };
}
