{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default

    common/core # required

    common/optionnal/hyprland
    common/optionnal/tools
    common/optionnal/browser.nix
    common/optionnal/vesktop.nix
    common/optionnal/walker.nix
    common/optionnal/kitty.nix
  ];
}
