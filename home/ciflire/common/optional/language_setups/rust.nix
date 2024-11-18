{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    rustc
    cargo
    rust-analyzer
    rustfmt
  ];
}
