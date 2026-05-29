{ config, pkgs, ... }:
{
  imports = [
    ./modules/discord.nix
    ./modules/ghostty.nix
    ./modules/cli.nix
  ];

  home.username = "barra";
  home.homeDirectory = "/home/barra";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
