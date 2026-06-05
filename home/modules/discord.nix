{
  programs.nixcord = {
    enable = true;

    discord = {
      commandLineArgs = [
        "--enable-features=VaapiVideoDecoder,MiddleClickAutoscroll"
        # use wayland and enable IME
        "--ozone-platform-hint=auto"
        "--enable-wayland-ime"
      ];
      # use equicord (vencord but with more plugins)
      vencord.enable = false;
      equicord.enable = true;

      # canary
      branch = "canary";
    };

    # config
    quickCss = builtins.readFile ../config/discord/quickCss.css;
    config = {
      useQuickCss = true;
      plugins = {
        # vencord
        textReplace = {
          enable = true;
          regexRules = [
            {
              "find" = "([^:])\\\\\\s*$";
              "replace" = "$1";
              "onlyIfIncludes" = "";
              "id" = "a9cae59b-78f5-478c-89c5-83e056ebe9d4";
            }
            {
              "find" = "https?:\\/\\/(?:www\\.)?youtube\\.com\\/(?:watch\\?v=|embed\\/|shorts\\/)([\\w\\-]{11})";
              "replace" = "https://youtu.be/$1";
              "onlyIfIncludes" = "";
              "id" = "0fe41f58-40f5-4c81-904e-d6d470762672";
            }
            {
              "find" = "https:\\/\\/youtu.be\\/([\\w\\-]{11})&(.+)";
              "replace" = "https://youtu.be/$1?$2";
              "onlyIfIncludes" = "";
              "id" = "b8f2f595-f5ea-4148-8fa6-dbf94311aea2";
            }
            {
              "find" =
                "https?:\\/\\/(?:www\\.)?instagram\\.com\\/(reels?|p|stories)(?!.*\\/audio\\b)((\\/[\\w\\.\\-]+)+)[^\\s>),]*";
              "replace" = "https://kkinstagram.com/$1$2";
              "onlyIfIncludes" = "";
              "id" = "5ed62ae3-7b0f-4bfe-a251-7bc2e19b0eaa";
            }
            {
              "find" =
                "https?:\\/\\/(?:www\\.)?((?:g|d|t)\\.)?(?:twitt(?:e|p)r|(?:fixup)?x)\\.com((\\/\\w+)+)[^\\s>),]*";
              "replace" = "https://$1fxtwitter.com$2";
              "onlyIfIncludes" = "";
              "id" = "82de6567-2be9-4d14-83d5-e36bfaf83fe0";
            }
            {
              "find" = "https?:\\/\\/(?:www\\.)?(v(?:t|m)\\.)?tiktok\\.com((\\/[\\w@]+)+)[^\\s>),]*";
              "replace" = "https://$1tnktok.com$2";
              "onlyIfIncludes" = "";
              "id" = "ce78ff53-197b-49bf-b480-dd372e77d8d4";
            }
            {
              "find" =
                "https?:\\/\\/(?:www\\.|(old\\.))?reddit\\.com\\/r\\/(\\w+)\\/(comments|s)\\/(\\w+)[\\w\\/\\-?=&]*";
              "replace" = "https://$1rxddit.com/r/$2/$3/$4";
              "onlyIfIncludes" = "";
              "id" = "a1745df8-a321-4be3-ab82-4f31d539bdae";
            }
            {
              "find" = "https?:\\/\\/(?:www\\.)?anilist\\.co\\/(anime|manga|character)\\/(\\d+)[^\\s>),]*";
              "replace" = "https://anilist.co/$1/$2";
              "onlyIfIncludes" = "";
              "id" = "9c4268b4-7094-40e5-9d95-7409d1d9c155";
            }
          ];
        };
        loadingQuotes = {
          enable = true;
          enablePluginPresetQuotes = false;
          additionalQuotes = "read if cute|meow :3|sometimes it takes a real man to become the best girl|roxy is proud of you!|nodnod|ganbatte!|separate fiction from reality|so based|hey! dw about it, everything will be alright!! trust|feelin cute|don't take someone's opinion too seriously|hello~ anyone theree??|...|ykwim";
        };
        consoleJanitor = {
          enable = true;
          disableLoggers = true;
        };
        imageZoom = {
          enable = true;
          square = true;
          size = 500.0;
        };
        messageLogger = {
          enable = true;
          inlineEdits = false;
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
        PinDMs = {
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
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
        };
        volumeBooster = {
          enable = true;
          multiplier = 3.0;
        };
        alwaysAnimate.enable = true;
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterRoleContext.enable = true;
        betterSessions.enable = true;
        betterSettings.enable = true;
        biggerStreamPreview.enable = true;
        BlurNSFW.enable = true;
        callTimer.enable = true;
        ClearURLs.enable = true;
        copyEmojiMarkdown.enable = true;
        copyFileContents.enable = true;
        CopyUserURLs.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        disableDeepLinks.enable = true;
        dontRoundMyTimestamps.enable = true;
        experiments.enable = true;
        expressionCloner.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        hideMedia.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLatency.enable = true;
        messageLinkEmbeds.enable = true;
        MutualGroupDMs.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noOnboardingDelay.enable = true;
        noPendingCount.enable = true;
        normalizeMessageLinks.enable = true;
        noUnblockToJump.enable = true;
        openInApp.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        reactErrorDecoder.enable = true;
        replyTimestamp.enable = true;
        revealAllSpoilers.enable = true;
        reverseImageSearch.enable = true;
        ReviewDB.enable = true;
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
        viewIcons.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        youtubeAdblock.enable = true;

        # equicord
        timezones = {
          enable = true;
          askedTimezone = true;
          showOwnTimezone = false;
        };
        equicordToolbox.enable = true;
        selfForward.enable = true;
      };
      # disable translate button on chatbar
      uiElements.chatBarButtons.translate.enable = false;
    };
  };
}
