{ pkgs, lib, ... }:
{
  # fonts
  fonts = {
    packages = with pkgs; [
      corefonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-lgc-plus
      noto-fonts-color-emoji

      twemoji-color-font
      nerd-fonts.jetbrains-mono
    ];

    # https://wiki.nixos.org/wiki/Fonts#Flatpak_applications_can't_find_system_fonts
    fontDir.enable = true;
  };

  # https://wiki.nixos.org/wiki/ONLYOFFICE#Install_and_use_missing_corefonts
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "corefonts" ];
}
