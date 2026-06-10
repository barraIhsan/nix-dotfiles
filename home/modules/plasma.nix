{ pkgs, config, ... }: {
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
          launchAction = "DoNotTakeScreenshot";
          clipboardGroup = "PostScreenshotCopyImage";
          autoSaveImage = true;
          rememberSelectionRect = "Never";
          useReleaseToCapture = true;
        };
        ImageSave = {
          imageCompressionQuality = 100;
          imageSaveLocation = "file://${config.xdg.userDirs.pictures}/screenshots/";
        };
        VideoSave.videoSaveLocation = "file://${config.xdg.userDirs.videos}/screencasts/";
      };
    };
  };

  home.packages = [ pkgs.papirus-icon-theme ];
}
