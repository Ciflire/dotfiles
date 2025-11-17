{ pkgs, ... }:
{
  networking.firewall.checkReversePath = false;
  networking.wireguard.enable = true;
  environment.systemPackages = with pkgs; [
    wireguard-tools
    protonvpn-gui
    # protonvpn-cli
  ];
  services.protonmail-bridge = {
    enable = true;
  };
}
