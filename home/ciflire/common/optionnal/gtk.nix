{pkgs, ...}: {
    gtk = {
        iconTheme = {
            name = "kora";
            package = pkgs.kora-icon-theme;
          };
      };
  }
