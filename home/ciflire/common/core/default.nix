{
  config,
  lib,
  pkgs,
  outputs,
  configLib,
  ...
}:
{
  imports = [
    ./carapace.nix
    ./direnv.nix
    ./fonts.nix
    ./nushell.nix
    ./starship.nix
    ./yazi
    ./zellij
    ./zoxide.nix
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
      SHELL = "nu";
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
      music = "${config.home.homeDirectory}/media/audio";
      pictures = "${config.home.homeDirectory}/media/images";
      videos = "${config.home.homeDirectory}/media/video";
      # publicshare = "/var/empty"; #using this option with null or "/var/empty" barfs so it is set properly in extraConfig below
      # templates = "/var/empty"; #using this option with null or "/var/empty" barfs so it is set properly in extraConfig below

      extraConfig = {
        # publicshare and templates defined as null here instead of as options because
        XDG_PUBLICSHARE_DIR = "/var/empty";
        XDG_TEMPLATES_DIR = "/var/empty";
      };
    };
  };

  home.packages = builtins.attrValues {
    inherit (pkgs)

      # Packages that don't have custom configs go here
      btop # resource monitor
      brightnessctl # brightness utility
      cliphist # clipboard history
      copyq # clipboard manager
      coreutils # basic gnu utils
      # curl
      eza # ls replacement
      dust # disk usage
      fd # tree style ls
      findutils # find
      fzf # fuzzy search
      grimblast # Bash utility for hyprland screenshots
      jq # JSON pretty printer and manipulator
      nix-tree # nix package tree viewer
      neofetch # fancier system info than pfetch
      ncdu # TUI disk usage
      nixd # nix lsp
      nixfmt-rfc-style # nix formatter
      p7zip # compression & encryption
      pciutils
      pfetch # system info
      playerctl # media player control
      pre-commit # git hooks
      pulsemixer # audio utility
      ripgrep # better grep
      rofi
      satty # screenshot editor
      steam-run # for running non-NixOS-packaged binaries on Nix
      usbutils
      tree # cli dir tree viewer
      unzip # zip extraction
      unrar # rar extraction
      xdg-utils # provide cli tools such as `xdg-mime` and `xdg-open`
      xdg-user-dirs
      wev # show wayland events. also handy for detecting keypress codes
      wget # downloader
      zip # zip compression
      ;
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
