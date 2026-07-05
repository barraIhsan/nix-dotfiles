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

    # .desktop file
    desktopEntries = {
      steam = {
        name = "Steam";
        exec = "xdg-fakehome Steam/fakehome steam %U";
        comment = "Application for managing and playing games on Steam";
        icon = "steam";
        categories = [
          "Network"
          "FileTransfer"
          "Game"
        ];
        mimeType = [
          "x-scheme-handler/steam"
          "x-scheme-handler/steamlink"
        ];
        prefersNonDefaultGPU = true;
        actions = {
          BigPicture = {
            name = "Big Picture";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/bigpicture";
          };
          Community = {
            name = "Community";
            exec = "xdg-fakehome Steam/fakehome steam steam://url/CommunityHome/";
          };
          Friends = {
            name = "Friends";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/friends";
          };
          Library = {
            name = "Library";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/games";
          };
          News = {
            name = "News";
            exec = "xdg-fakehome Steam/fakehome steam steam://openurl/https://store.steampowered.com/news";
          };
          Screenshots = {
            name = "Screenshots";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/screenshots";
          };
          Servers = {
            name = "Servers";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/servers";
          };
          Settings = {
            name = "Settings";
            exec = "xdg-fakehome Steam/fakehome steam steam://open/settings";
          };
          Store = {
            name = "Store";
            exec = "xdg-fakehome Steam/fakehome steam steam://store";
          };
        };
      };
      thunderbird = {
        name = "Thunderbird";
        exec = "xdg-fakehome thunderbird thunderbird --name thunderbird %U";
        comment = "Read and write e-mails or RSS feeds, or manage tasks on calendars.";
        icon = "thunderbird";
        categories = [
          "Network"
          "Chat"
          "Email"
          "Feed"
          "GTK"
          "News"
        ];
        settings.Keywords = "mail;email;e-mail;messages;rss;calendar;address book;addressbook;chat";
        mimeType = [
          "message/rfc822"
          "x-scheme-handler/mailto"
          "text/calendar"
          "text/x-vcardmessage/rfc822"
          "x-scheme-handler/mailto"
          "text/calendar"
          "text/x-vcard"
        ];
        actions = {
          profile-manager-window = {
            name = "Profile Manager";
            exec = "xdg-fakehome thunderbird thunderbird --ProfileManager";
          };
        };
      };
      # disable umpv
      umpv = {
        name = "umpv Media Player";
        comment = "Play movies and songs";
        exec = "umpv %U";
        icon = "mpv";
        noDisplay = true;
        mimeType = [ ];
      };
    };
  };
}
