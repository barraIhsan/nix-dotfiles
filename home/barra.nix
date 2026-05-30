{ config, pkgs, ... }:
{
  imports = [
    ./modules/xdg.nix
    ./modules/cli.nix

    ./modules/discord.nix
    ./modules/ghostty.nix
    ./modules/mpv.nix
  ];

  home.username = "barra";
  home.homeDirectory = "/home/barra";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
