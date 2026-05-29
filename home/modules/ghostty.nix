{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;

      window-padding-x = 5;
      window-padding-y = 5;
      window-decoration = "none";
      maximize = true;

      bell-features = "no-attention";
      confirm-close-surface = false;

      keybind = [
        "ctrl+enter=unbind"
        "f11=toggle_fullscreen"
      ];
    };
  };
}
