{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rust
    rustc
    cargo
    rust-analyzer
    rustfmt
  ];
}
