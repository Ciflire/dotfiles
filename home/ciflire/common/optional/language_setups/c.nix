{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake
    rocmPackages.llvm.clang
    clang-tools
    lldb_18
  ];
}
