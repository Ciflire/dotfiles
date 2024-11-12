{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default

    common/core # required

    common/optionnal/browser.nix
    common/optionnal/helix.nix
    common/optionnal/hyprland
    common/optionnal/kitty.nix
    common/optionnal/sops.nix
    common/optionnal/ssh.nix
    common/optionnal/tools
    common/optionnal/vesktop.nix
    common/optionnal/walker.nix
  ];
}
