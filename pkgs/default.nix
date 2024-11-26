{
  pkgs ? import <nixpkgs> { },
}:
{

  #################### Packages with external source ####################

  monolisa = pkgs.callPackage ./monolisa.nix { };

  ltex-ls-plus = pkgs.callPackage ./ltex-ls-plus-nightly.nix { };
  ltex-ls-plus-release = pkgs.callPackage ./ltex-ls-plus-release.nix { };

  fancy-cat = pkgs.callPackage ./fancy-cat { };
}
