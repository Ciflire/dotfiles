{
  pkgs ? import <nixpkgs> { },
# master-pkgs ? import <nixpkgs> { },
}:
{

  #################### Packages with external source ####################

  awrit = pkgs.callPackage ./awrit.nix { };

  # fancy-cat = pkgs.callPackage ./fancy-cat { };
  fiji = pkgs.callPackage ./fiji.nix { };
  gruvbox-gtk-theme = pkgs.callPackage ./gruvbox-gtk-theme.nix { };
  ltex-ls-plus = pkgs.callPackage ./ltex-ls-plus-nightly.nix { };
  ltex-ls-plus-release = pkgs.callPackage ./ltex-ls-plus-release.nix { };
  monolisa = pkgs.callPackage ./monolisa.nix { };
  plantuml-lsp = pkgs.callPackage ./plantuml-lsp.nix { };
  # posting = pkgs.callPackage ./posting.nix { };
  rust_hdl = pkgs.callPackage ./rust_hdl.nix { };
  schemat = pkgs.callPackage ./schemat.nix { };
  textual-autocomplete = pkgs.callPackage ./textual-autocomplete.nix { };
  tlafmt = pkgs.callPackage ./tlafmt.nix { };

}
