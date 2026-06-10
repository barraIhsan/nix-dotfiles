{ pkgs, ... }: {
  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      twemoji-color-font
      nerd-fonts.jetbrains-mono
    ];

    # https://wiki.nixos.org/wiki/Fonts#Flatpak_applications_can't_find_system_fonts
    fontDir.enable = true;
  };
}
