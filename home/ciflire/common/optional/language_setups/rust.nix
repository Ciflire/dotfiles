{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gcc
    rustc
    cargo
    clippy
    rust-analyzer
    rustfmt
  ];
}
