{ inputs, pkgs, ... }:
{
  programs.nixcord = {
    enable = true;

    discord = {
      commandLineArgs = [
        "--enable-blink-features=MiddleClickAutoscroll"
        # enable vaapi
        "--render-node-override=/dev/dri/renderD129"
        # use wayland and enable IME
        "--ozone-platform-hint=auto"
        "--enable-wayland-ime"
      ];
      vencord.enable = true;
      openASAR.enable = false;
    };

    # user plugins
    userPlugins = {
      latex = "github:vgskye/ventex/a808366a824a944395ffabd60a0071137080fce0";
    };
    extraConfig.plugins = {
      KaTeX.enable = true;
    };
    # config
    quickCss = builtins.readFile ../config/discord/quickCss.css;
    config = {
      useQuickCss = true;
      plugins = {
        # vencord
        textReplace = {
          enable = true;
          stringRules = [
            {
              # why? why not
              name = "iphone ahhh omw autocomplete";
              find = "omw";
              replace = "On my way!";
            }
          ];
          regexRules = [
            {
              name = "Accidental \\";
              find = "([^:])\\\\\\s*$";
              replace = "$1";
            }
            {
              name = "YouTube link shortener #1";
              find = "https?:\\/\\/(?:www\\.)?youtube\\.com\\/(?:watch\\?v=|embed\\/|shorts\\/)([\\w\\-]{11})";
              replace = "https://youtu.be/$1";
            }
            {
              name = "YouTube link shortener #2";
              find = "https:\\/\\/youtu.be\\/([\\w\\-]{11})&(.+)";
              replace = "https://youtu.be/$1?$2";
            }
            # embed fixer
            {
              name = "Instagram embed fixer";
              find = "https?:\\/\\/(?:www\\.)?((?:g|d|t)\\.)?instagram\\.com\\/((reels?|p)(\\/[\\w\\-]{11}))[\\/\\-\\w?&=\\-]*";
              replace = "https://$1oginstagram.com/$2";
            }
            {
              name = "Twitter embed fixer";
              find = "https?:\\/\\/(?:www\\.)?((?:g|d|t)\\.)?(?:twitter|x)\\.com\\/(\\w+\\/status\\/\\d{19})[\\/\\-\\w?&=]*";
              replace = "https://$1fxtwitter.com/$2";
            }
            {
              name = "TikTok embed fixer";
              find = "https?:\\/\\/(?:www\\.)?(v(?:t|m)\\.)?tiktok\\.com\\/(@(\\w+\\/){2}\\d+|\\w+)[\\/\\-\\w?&=%.]*";
              replace = "https://$1tnktok.com/$2";
            }
            {
              name = "Reddit embed fixer";
              find = "https?:\\/\\/(?:www\\.|old\\.)?reddit\\.com\\/r\\/(\\w+\\/(comments|s)\\/\\w{7,11})[\\/\\-\\w?&=]*";
              replace = "https://vxreddit.com/r/$1";
            }
            {
              name = "AniList embed fixer";
              find = "https?:\\/\\/(?:www\\.)?anilist\\.co\\/((anime|manga|character)\\/(\\d+))[\\/\\-\\w?&=]*";
              replace = "https://anilist.co/$1";
            }
            {
              name = "Pixiv embed fixer";
              find = "https?:\\/\\/(?:www\\.)?pixiv\\.net\\/((\\w{2}\\/)?artworks\\/\\d{9}(\\/[\\d\\-]+)?)[\\/\\-\\w?&=]*";
              replace = "https://phixiv.net/$1";
            }
          ];
        };
        loadingQuotes = {
          enable = true;
          enablePluginPresetQuotes = false;
          additionalQuotes = "read if cute|meow :3|sometimes it takes a real man to become the best girl|roxy is proud of you!|nodnod|ganbatte!|separate fiction from reality|so based|hey! dw about it, everything will be alright!! trust|feelin cute|don't take someone's opinion too seriously|hello~ anyone theree??|...|ykwim|hmph|hewwo|she's so cuteeee|keep her till marriage :3|wife material|11/10 girl|she's the one|why are you so cutee baee|im so lucky to have you|cunnyyyy";
        };
        imageZoom = {
          enable = true;
          square = true;
          size = 500.0;
        };
        messageLatency = {
          enable = true;
          showMillis = true;
        };
        messageLogger = {
          enable = true;
          inlineEdits = false;
          ignoreBots = true;
        };
        newGuildSettings = {
          enable = true;
          messages = 1;
        };
        noBlockedMessages = {
          enable = true;
          ignoreMessages = true;
        };
        notificationVolume = {
          enable = true;
          notificationVolume = 50.0;
        };
        pinDms = {
          enable = true;
          pinOrder = 1;
          # https://github.com/FlameFlag/nixcord/issues/205
          # actually define pinned dm channel ids until the issue is resolved
          userBasedCategoryList = {
            "462942476542672897" = [
              {
                "id" = "dlbj354xeps";
                "name" = "<3";
                "color" = 15277667;
                "collapsed" = false;
                "channels" = [
                  "1460617378911092811"
                  "1387789405518958695"
                  "1460909633899073683"
                  "1307974301940711486"
                  "1426180226630680641"
                ];
              }
            ];
          };
        };
        platformIndicators = {
          enable = true;
          messages = false;
        };
        relationshipNotifier = {
          enable = true;
          notices = true;
        };
        serverListIndicators = {
          enable = true;
          mode = 3;
          useCompact = true;
        };
        shikiCodeblocks = {
          enable = true;
          theme = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
        };
        viewRaw = {
          enable = true;
          messageContextMenu = true;
        };
        volumeBooster = {
          enable = true;
          multiplier = 3.0;
        };
        addAttachments.enable = true;
        alwaysAnimate.enable = true;
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterRoleContext.enable = true;
        betterSessions.enable = true;
        biggerStreamPreview.enable = true;
        blurNsfw.enable = true;
        callTimer.enable = true;
        characterCounter.enable = true;
        clearUrls.enable = true;
        copyFileContents.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        directFileDownload.enable = true;
        disableCallIdle.enable = true;
        disableDeepLinks.enable = true;
        dontRoundMyTimestamps.enable = true;
        experiments.enable = true;
        expressionManager.enable = true;
        favoriteEmojiFirst.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        gifPaste.enable = true;
        gifProviderSwitcher.enable = true;
        hideMedia.enable = true;
        implicitRelationships.enable = true;
        jumpToTop.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        mutualGroupDms.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noOnboardingDelay.enable = true;
        noPendingCount.enable = true;
        noUnblockToJump.enable = true;
        openInApp.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        replyTimestamp.enable = true;
        revealAllSpoilers.enable = true;
        reverseImageSearch.enable = true;
        reviewDb.enable = true;
        roleColorEverywhere.enable = true;
        secretRingToneEnabler.enable = true;
        serverInfo.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        spotifyCrack.enable = true;
        spotifyShareCommands.enable = true;
        stickerPaste.enable = true;
        themeAttributes.enable = true;
        translate.enable = true;
        typingTweaks.enable = true;
        unindent.enable = true;
        unlockedAvatarZoom.enable = true;
        unsuppressEmbeds.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        voiceDownload.enable = true;
        youtubeAdblock.enable = true;
      };
      # disable certain ui elements
      uiElements = {
        chatBarButtons.Translate.enable = false;
        messagePopoverButtons = {
          AddAttachments.enable = false;
          ViewRaw.enable = false;
          MessageLogger.enable = false;
          Translate.enable = false;
        };
      };
    };
  };
}
