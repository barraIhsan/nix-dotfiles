{ config, pkgs, ... }:
{
  xdg.enable = true;
  xdg.userDirs = {
    desktop = "${config.home.homeDirectory}";
    download = "${config.home.homeDirectory}/downloads";
    templates = "${config.home.homeDirectory}";
    publicShare = "${config.home.homeDirectory}";
    documents = "${config.home.homeDirectory}/documents";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/media";
    videos = "${config.home.homeDirectory}/media";
    projects = "${config.home.homeDirectory}/dev";
  };

  xdg.dataFile."icons/default" = {
    source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors/";
    recursive = true;
  };
}
