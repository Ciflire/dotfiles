{
  config,
  inputs,
  lib,
  pkgs,
  outputs,
  ...
}:
{
  imports = [
    ./direnv.nix
    ./fonts.nix
    # ./nushell.nix
    ./term_tools.nix
  ];
  services.ssh-agent.enable = true;

  home = {
    username = lib.mkDefault "ciflire";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.11";
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/scripts/talon_scripts"
    ];
    sessionVariables = {
      FLAKE = "$HOME/dotfiles";
      SHELL = "bash";
      TERM = "kitty";
      TERMINAL = "kitty";
      VISUAL = "hx";
      EDITOR = "hx";
      MANPAGER = "batman"; # see ./cli/bat.nix
      NIXOS_OZONE_WL = "1";
    };
    preferXdgDirectories = true; # whether to make programs use XDG directories whenever supported

  };
  #TODO:(xdg) maybe move this to its own xdg.nix?
  # xdg packages are pulled in below
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/.desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Musics";
      pictures = "${config.home.homeDirectory}/Pictures";
      projects = "${config.home.homeDirectory}/Projects";
      videos = "${config.home.homeDirectory}/Videos";
      # publicshare = "/var/empty"; #using this option with null or "/var/empty" barfs so it is set properly in extraConfig below
      # templates = "/var/empty"; #using this option with null or "/var/empty" barfs so it is set properly in extraConfig below

      extraConfig = {
        # publicshare and templates defined as null here instead of as options because
        XDG_PUBLICSHARE_DIR = "/var/empty";
        XDG_TEMPLATES_DIR = "/var/empty";
      };
    };
  };

  home.packages = with pkgs; [

    ghostty
    (libreoffice-qt6-fresh.overrideAttrs (oa: {
      kdeIntegration = true;
    }))
    ncdu # TUI disk usage
    nix-tree # nix package tree viewer
    nixd # nix lsp
    nixfmt-rfc-style # nix formatter
    pfetch # system info
    # posting
    pre-commit # git hooks
    # prismlauncher
    protonmail-desktop
    proton-pass
    pulsemixer # audio utility
    qbittorrent-enhanced
    ripgrep # better grep
    rofi
    ryubing
    satty # screenshot editor
    shfmt
    slurp
    steam-run # for running non-NixOS-packaged binaries on Nix
    tidal-hifi
    usbutils
    uv
    vlc
    xdg-utils # provide cli tools such as `xdg-mime` and `xdg-open`
    xdg-user-dirs
    # xournalpp
    wev # show wayland events. also handy for detecting keypress codes
    winboat
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  # nix = {
  #   package = lib.mkDefault pkgs.nix;
  #   settings = {
  #     experimental-features = [
  #       "nix-command"
  #       "flakes"
  #     ];
  #     warn-dirty = false;
  #   };
  # };

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
