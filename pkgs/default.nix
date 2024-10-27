{ pkgs ? import <nixpkgs> { }
,
}:
{

  #################### Packages with external source ####################

  monolisa = pkgs.callPackage ./monolisa.nix { };
}
