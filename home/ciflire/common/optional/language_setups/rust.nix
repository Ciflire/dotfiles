{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    gcc
    cargo
    clippy
    rust-analyzer
    rustfmt
  ];
}
