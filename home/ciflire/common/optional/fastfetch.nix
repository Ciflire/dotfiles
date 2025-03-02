{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "/home/ciflire/Downloads/logo_nix.png";
        padding = {
          right = 1;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = " -> ";
      };
      modules = [
        "Break"
        "Break"
        "Break"
        "Title"
        {
          type = "Separator";
          string = "-";
          length = 20;
        }
        {
          type = "datetime";
          key = "Date";
          format = "{1}-{3}-{11}";
        }
        {
          type = "datetime";
          key = "Time";
          format = "{14}:{17}:{20}";
        }
        "battery"
        "DE"
        "CPU"
        "GPU"
        "Kernel"
        "OS"
        "break"
        "player"
        "media"
      ];
    };
  };
}
