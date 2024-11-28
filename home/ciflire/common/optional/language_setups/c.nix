{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang-tools
    lldb_18
  ];
}
