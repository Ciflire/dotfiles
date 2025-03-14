{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zig_0_13
    zls
  ];
}
