{ config, pkgs, ... }:
{
  home.username = "barra";
  home.homeDirectory = "/home/barra";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
