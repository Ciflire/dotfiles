{ pkgs, ... }:
{
  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  security.pam.yubico = {
    enable = true;
    debug = true;
    mode = "challenge-response";
    id = [ "34347397" ];
  };

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubioath-flutter
  ];

}
