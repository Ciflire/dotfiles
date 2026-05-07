{ pkgs, ... }:
{

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  hardware.gpgSmartcards.enable = true;

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

  # YubiKey
  environment.systemPackages = with pkgs; [
    yubikey-personalization # CLI tools for configuring YubiKey
    yubikey-manager # Manage YubiKey settings
    yubioath-flutter
    yubikey-agent
    libfido2 # Support for FIDO2/WebAuthn
    opensc # Smart card support
    gnupg # If using GPG with YubiKey
    pcsclite
  ];

  services = {
    udev.packages = with pkgs; [ yubikey-personalization ];
    pcscd.enable = true;
    yubikey-agent.enable = true;

  };

}
