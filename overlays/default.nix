{ inputs, ... }:
{

  spotify-player = import ./spotify-player;

  additions = final: _prev: import ../pkgs { pkgs = final; };

}
