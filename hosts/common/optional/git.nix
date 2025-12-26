{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.email = "leo.vesse@pm.me";
      user.name = "VESSE Léo";
      user.signingkey = "565097838188A405";
      commit.gpgsign = true;
    };
  };
}
