{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonup-qt
    lutris
    heroic
    vita3k
    winetricks
  ];
}
