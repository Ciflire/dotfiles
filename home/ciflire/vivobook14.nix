{ inputs, ... }:
{
  imports = [
    common/core # required

    common/optional/fastfetch.nix
    common/optional/ghostty.nix
    common/optional/gui.nix
    common/optional/sops.nix
    common/optional/ssh.nix
    common/optional/thunderbird.nix
    common/optional/tui.nix

    common/optional/language_setups/csharp.nix
    common/optional/language_setups/nix.nix
    common/optional/language_setups/typst.nix
  ];
}
