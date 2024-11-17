{ pkgs, ... }:
{
  home.packages = with pkgs; [
    docker-compose-language-service
    dockerfile-language-server-nodejs
  ];
}
