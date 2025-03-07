{
  pkgs ? import <nixpkgs> { },
  master-pkgs,
}:
{

  #################### Packages with external source ####################

  awrit = pkgs.callPackage ./awrit.nix { };

  fancy-cat = master-pkgs.callPackage ./fancy-cat { };
  ltex-ls-plus = pkgs.callPackage ./ltex-ls-plus-nightly.nix { };
  ltex-ls-plus-release = pkgs.callPackage ./ltex-ls-plus-release.nix { };
  monolisa = pkgs.callPackage ./monolisa.nix { };
  posting = pkgs.callPackage ./posting.nix { };
  textual-autocomplete = pkgs.callPackage ./textual-autocomplete.nix { };

}
