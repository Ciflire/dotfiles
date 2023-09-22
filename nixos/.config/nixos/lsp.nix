{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [

    gnumake
    cmake

    typst
    typst-lsp
    typst-fmt

    python312
    python311Packages.python-lsp-server 
    python311Packages.dbus-python
    nodePackages_latest.prettier

    rnix-lsp

    lua-language-server
    stylua
  ];
}
