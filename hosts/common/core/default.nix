{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}:
{
  imports = lib.flatten [
    # (configLib.scanPaths ./.)
    # (configLib.relativeToRoot "hosts/common/users/${configVars.username}")
    # inputs.home-manager.nixosModules.home-manager
    # (builtins.attrValues outputs.nixosModules)
    ./firmware.nix
    ./locales.nix
    ./networking.nix
    ./nix.nix
    ./sops.nix
  ];

  # This should be handled by config.security.pam.sshAgentAuth.enable
  security.sudo.extraConfig = ''
    Defaults lecture = never # rollback results in sudo lectures after each reboot, it's somewhat useless anyway
    Defaults pwfeedback # password input feedback - makes typed password visible as asterisks
    Defaults timestamp_timeout=120 # only ask for password every 2h
    # Keep SSH_AUTH_SOCK so that pam_ssh_agent_auth.so can do its magic.
    Defaults env_keep+=SSH_AUTH_SOCK
  '';

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };

  nixpkgs = {
    # you can add global overlays here
    overlays = builtins.attrValues outputs.overlays;

    config = {
      allowUnfree = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
}
