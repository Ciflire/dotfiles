{ ... }:
{
  programs.git = {

    enable = true;
    config = {
      user.email = "leo.vesse@pm.me";
      user.name = "VESSE Léo";
      user.signingkey = "212B1C2241F207AB";
      commit.gpgsign = true;
    };
  };
}
