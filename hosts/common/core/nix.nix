{ config, ... }:
{

  sops.secrets."github_token" = {
    path = "/home/ciflire/.config/nix/github_token.conf";
    mode = "0400";
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    extraOptions = "!include ${config.sops.secrets."github_token".path}";
  };
}
