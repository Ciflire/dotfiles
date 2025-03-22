{ inputs, pkgs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    validateSopsFiles = false;

    age = {
      sshKeyPaths = [
        "/etc/ssh/ssh_host_key"
      ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
  };

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
    mkpasswd
  ];
}
