{
  inputs,
  self,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/home/ciflire/.config/sops/age/keys.txt";

    defaultSopsFile = ../../../../secrets/secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      weather_api_key = {
        format = "json";
        sopsFile = ../../../../secrets/weatherapi.json;
        key = "";
      };
      "private_keys/gitlab" = {
        path = "/home/ciflire/.ssh/gitlab";
      };
      "private_keys/github" = {
        path = "/home/ciflire/.ssh/github";
      };
      "private_keys/gibson" = {
        path = "/home/ciflire/.ssh/gibson";
      };
      "private_keys/tnnet" = {
        path = "/home/ciflire/.ssh/tnnet";
      };
      "private_keys/agamotto" = {
        path = "/home/ciflire/.ssh/agamotto";
      };
      classic_circle = {
        path = "${config.xdg.userDirs.pictures}/pp/classic_circle.svg";
        sopsFile = ../../../../secrets/classic_circle.svg;
        format = "binary";
      };
      classic_circle_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/classic_circle_gradient.svg";
        sopsFile = ../../../../secrets/classic_circle_gradient.svg;
        format = "binary";
      };
      classic_square = {
        path = "${config.xdg.userDirs.pictures}/pp/classic_square.svg";
        sopsFile = ../../../../secrets/classic_square.svg;
        format = "binary";
      };
      classic_square_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/classic_square_gradient.svg";
        sopsFile = ../../../../secrets/classic_square_gradient.svg;
        format = "binary";
      };
      halloween_circle = {
        path = "${config.xdg.userDirs.pictures}/pp/halloween_circle.svg";
        sopsFile = ../../../../secrets/halloween_circle.svg;
        format = "binary";
      };
      halloween_circle_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/halloween_circle_gradient.svg";
        sopsFile = ../../../../secrets/halloween_circle_gradient.svg;
        format = "binary";
      };
      halloween_square = {
        path = "${config.xdg.userDirs.pictures}/pp/halloween_square.svg";
        sopsFile = ../../../../secrets/halloween_square.svg;
        format = "binary";
      };
      halloween_square_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/halloween_square_gradient.svg";
        sopsFile = ../../../../secrets/halloween_square_gradient.svg;
        format = "binary";
      };
      christmas_circle = {
        path = "${config.xdg.userDirs.pictures}/pp/christmas_circle.svg";
        sopsFile = ../../../../secrets/christmas_circle.svg;
        format = "binary";
      };
      christmas_circle_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/christmas_circle_gradient.svg";
        sopsFile = ../../../../secrets/christmas_circle_gradient.svg;
        format = "binary";
      };
      christmas_square = {
        path = "${config.xdg.userDirs.pictures}/pp/christmas_square.svg";
        sopsFile = ../../../../secrets/christmas_square.svg;
        format = "binary";
      };
      christmas_square_gradient = {
        path = "${config.xdg.userDirs.pictures}/pp/christmas_square_gradient.svg";
        sopsFile = ../../../../secrets/christmas_square_gradient.svg;
        format = "binary";
      };

    };
  };
}
