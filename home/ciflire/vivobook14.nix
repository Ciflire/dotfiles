{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default

    common/core # required

    common/optional/browser.nix
    common/optional/helix.nix
    common/optional/hyprland
    common/optional/kitty.nix
    common/optional/obs.nix
    common/optional/sops.nix
    common/optional/ssh.nix
    common/optional/tools
    common/optional/vesktop.nix
    common/optional/walker.nix

    # Languages
    common/optional/language_setups/docker.nix
    common/optional/language_setups/rust.nix
    common/optional/language_setups/typst.nix
  ];
}
