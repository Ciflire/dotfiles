{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
}
