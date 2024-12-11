{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    cargo
    clippy
    rust-analyzer
    rustfmt
  ];
}
