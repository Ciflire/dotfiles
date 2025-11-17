{ pkgs, ... }:
{
  home.packages = with pkgs; [
    taplo # lsp for TOML files
    rustc
    gcc
    cargo
    clippy
    rust-analyzer
    rustfmt
  ];
}
