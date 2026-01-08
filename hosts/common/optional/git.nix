{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.email = "leo.vesse@pm.me";
      user.name = "VESSE Léo";
      user.signingkey = "C900ED26D95586C0";
      commit.gpgsign = true;
    };
  };
}
