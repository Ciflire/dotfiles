{ pkgs, ... }:
{
  hardware.openrazer = {
    enable = true;
    users = [ "ciflire" ];
  };
  environment.systemPackages = with pkgs; [ polychromatic ];
}
