{ ... }:
{
  xdg.desktopEntries.steam = {
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
}
