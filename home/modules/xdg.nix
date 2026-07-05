{ config, pkgs, ... }:
{
  xdg = {
    enable = true;
    userDirs = {
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

    dataFile."icons/default" = {
      source = "${pkgs.kdePackages.breeze}/share/icons/breeze_cursors/";
      recursive = true;
    };

    # mime
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "org.kde.dolphin.desktop";
        "application/xml" = "org.kde.kate.desktop";

        "video/x-matroska" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "image/gif" = "mpv.desktop";

        "image/png" = "org.kde.gwenview.desktop";
        "image/jpeg" = "org.kde.gwenview.desktop";
        "image/webp" = "org.kde.gwenview.desktop";
        "image/avif" = "org.kde.gwenview.desktop";
      };
      associations.added = {
        "inode/directory" = [
          "mpv.desktop"
          "qdirstat.desktop"
        ];
        "audio/flac" = "org.musicbrainz.Picard.desktop";
        "video/x-matroska" = "org.bunkus.mkvtoolnix-gui.desktop";
      };
    };
  };
}
