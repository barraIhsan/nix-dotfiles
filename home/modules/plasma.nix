{ pkgs, config, ... }:
{
  services.kdeconnect.enable = true;

  programs.plasma = {
    enable = true;

    workspace = {
      # set theme
      colorScheme = "BreezeDark";
      iconTheme = "Papirus-Dark";

      # no middle click paste please
      enableMiddleClickPaste = false;
    };

    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    input = {
      touchpads = [
        {
          vendorId = "06cb";
          productId = "ce78";
          name = "SYNA2BA6:00 06CB:CE78 Touchpad";
          naturalScroll = true;
        }
      ];
      mice = [
        # wireless 2.4ghz
        {
          vendorId = "373b";
          productId = "10c9";
          name = "Compx Nearlink Mouse Dongle";
          accelerationProfile = "none";
        }
        # wired
        {
          vendorId = "373b";
          productId = "1135";
          name = "Compx ATK A9 SE Nearlink";
          accelerationProfile = "none";
        }
      ];
    };

    panels = [
      {
        location = "bottom";
        screen = "all";
        hiding = "dodgewindows";
        widgets = [
          {
            # app launcher
            kickoff = {
              icon = "nix-snowflake-white";
              sortAlphabetically = true;
              compactDisplayStyle = true;
            };
          }
          {
            # pinned apps
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:firefox.desktop"
                "applications:discord.desktop"
                "applications:com.mitchellh.ghostty.desktop"
                "applications:steam.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            systemTray = {
              items = {
                shown = [
                  # right to left (for reference)
                  "org.kde.plasma.battery"
                  "org.kde.plasma.networkmanagement" # wifi/ethernet
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.volume"
                  "org.kde.plasma.notifications" # notification will always be on the leftmost
                ];
                hidden = [
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.mediacontroller"
                  "org.kde.plasma.brightness"
                  "org.kde.plasma.printmanager"
                  "org.kde.plasma.vault"
                  "org.kde.plasma.weather"
                  "plasmashell_microphone"
                  "chrome_status_icon_1" # discord
                ];
                # currently doesn't work
                # see https://github.com/nix-community/plasma-manager/issues/565#issuecomment-3837849097
                # configs = {
                #   battery.showPercentage = true;
                #   "org.kde.plasma.digitalClock".config = {
                #     popupHeight = 451;
                #     popupWidth = 396;
                #   };
                # };
              };
            };
          }
          {
            digitalClock = {
              date.format.custom = "dd MMM yyyy";
              time.format = "12h";
              calendar = {
                firstDayOfWeek = "sunday";
                showWeekNumbers = true;
              };
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    shortcuts = {
      "services/org.kde.spectacle.desktop" = {
        CurrentMonitorScreenShot = "Shift+Print";
        FullScreenScreenShot = "";
        OpenWithoutScreenshot = "";
        RecordRegion = "Ctrl+Print\tMeta+R";
        RecordScreen = "Ctrl+Shift+Print";
        RectangularRegionScreenShot = "Print";
        _launch = "none";
      };
    };

    configFile = {
      kwinrc = {
        # disable default hot corner
        Effect-overview.BorderActivate = 9;
        # disable blue line thingy when you hover your mouse
        # near the hidden panel
        Plugins.screenedgeEnabled = false;
        # uncheck "Show selected windows" on alt tab (task switcher)
        # the default is that, when you do alt tab,
        # the selected window will be shown
        TabBox.HighlightWindows = false;
      };

      # disable audio feedback when changing volume
      plasmaparc.General.AudioFeedback = false;

      spectaclerc = {
        General = {
          # "When launching Spectacle: Do not take a screenshot automatically"
          launchAction = "DoNotTakeScreenshot";
          # "After taking a screenshot: Save file to default folder & Copy image to clipboard"
          clipboardGroup = "PostScreenshotCopyImage";
          autoSaveImage = true;
          # "Remember selected area: Never"
          rememberSelectionRect = "Never";
          # "Rectangular Region Selection: Accept on click-and-release"
          useReleaseToCapture = true;
        };
        ImageSave = {
          imageCompressionQuality = 100;
          imageSaveLocation = "file://${config.xdg.userDirs.pictures}/screenshots/";
        };
        VideoSave.videoSaveLocation = "file://${config.xdg.userDirs.videos}/screencasts/";
      };

      dolphinrc = {
        General = {
          # "Keep a single Dolphin window, opening new folders in tabs"
          OpenExternallyCalledFolderInNewTab = true;
          # "Display Style: Remember display style for each folder"
          GlobalViewProps = false;
          # "Display Style: Use icons view mode for locations which mostly contain media files"
          DynamicView = true;
        };
      };
    };
  };

  # dolphin
  # menu & toolbar
  xdg.dataFile."kxmlgui5/dolphin/dolphinui.rc".source = ../config/plasma/dolphin/dolphinui.rc;
  # locations
  xdg.dataFile."user-places.xbel".source = ../config/plasma/dolphin/user-places.xbel;

  home.packages = [ pkgs.papirus-icon-theme ];
}
