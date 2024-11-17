{
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = ./base16schemes/macchiato.yaml;
    image = ../../../../home/ciflire/common/optionnal/hyprland/wallpapers/forrest.png;
    autoEnable = true;
    polarity = "dark";
    cursor = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
      size = 28;
    };
  };
  programs.dconf.enable = true;
}
