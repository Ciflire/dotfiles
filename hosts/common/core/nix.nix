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
        "https://walker-git.cachix.org"
        "https://walker.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      ];
      download-buffer-size = 524288000;
    };
    extraOptions = "!include ${config.sops.secrets."github_token".path}";
  };
}
