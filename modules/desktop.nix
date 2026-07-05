{ pkgs, ... }:
{
  # enable plasma and sddm
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # use fcitx5 for IME and install mozc (jp)
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-mozc-ut
        fcitx5-gtk
      ];
      ignoreUserConfig = true;
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "mozc";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "mozc";
        };
        globalOptions = {
          Hotkey = {
            ActivateKeys = "";
            DeactivateKeys = "";
            AltTriggerKeys = "";
          };
          "Hotkey/TriggerKeys"."0" = "Super+space";
        };
      };
    };
  };

  # cups for printing
  services.printing.enable = true;

  # brightness/backlit
  environment.systemPackages = [
    pkgs.ddcutil
    pkgs.brightnessctl
  ];
  hardware.i2c.enable = true;

  # for some reason when i use wired mode on my mouse (ATK A9 SE)
  # there's one device/event that acts as a keyboard that'll hold right alt
  # thus disabling me typing normally cuz the right alt is being held
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1135", ENV{ID_INPUT_KEYBOARD}=="1", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';

  # flatpak
  services.flatpak.enable = true;

  # mozilla
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;

  # zsh
  programs.zsh.enable = true;
  programs.zsh.shellInit = ''
    export ZDOTDIR="$HOME/.config/zsh"
  '';

  # gnupg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
