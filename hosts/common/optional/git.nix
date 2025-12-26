{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.email = "leo.vesse@pm.me";
      user.name = "VESSE Léo";
      user.signingkey = "34347397";
    };
  };
}
