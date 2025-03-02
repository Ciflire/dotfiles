{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnumake
    # rocmPackages.llvm.clang
    clang-tools
    # TODO
    # lldb_18
  ];
}
