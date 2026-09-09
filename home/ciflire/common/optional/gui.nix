{ pkgs, ... }: {
  home.packages = with pkgs; [

    discord
    prismlauncher
    osu-lazer-bin
    sone
    winboat
    zed-editor
  ];
}
