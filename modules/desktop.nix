{ pkgs, lib, ... }:
let
  user = "barra";
in
{
  # enable plasma and sddm
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    theme = "breeze";
    extraPackages = [ pkgs.papirus-icon-theme ];
    settings.Theme.CursorTheme = "miku";
  };

  # sync plasma config into sddm
  systemd.services.sddm-sync-plasma-config = {
    description = "Sync Plasma theme/display config into SDDM";
    before = [ "display-manager.service" ];
    wantedBy = [ "display-manager.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      mkdir -p /var/lib/sddm/.config
      for f in kdeglobals plasmarc kwinoutputconfig.json kcminputrc; do
        src="/home/${user}/.config/$f"
        if [ -f "$src" ]; then
          cp -f "$src" "/var/lib/sddm/.config/$f"
        fi
      done
      chown -R sddm:sddm /var/lib/sddm/.config
    '';
  };

  # configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # ld
  programs.nix-ld = {
    enable = true;
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
    for f in /etc/profiles/per-user/*/etc/profile.d/hm-session-vars.sh; do
      [ -r "$f" ] && . "$f"
    done
  '';

  # gnupg
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # tailscale
  services.tailscale.enable = true;

  # redis
  services.redis.servers."".enable = true;

  # docker
  virtualisation.docker.enable = true;

  # postgres
  services.postgresql.enable = true;

  # dont enable the service, rather i'd start the service myself
  systemd.targets.postgresql.wantedBy = lib.mkForce [ ];
  systemd.services.redis.wantedBy = lib.mkForce [ ];
  systemd.services.docker.wantedBy = lib.mkForce [ ];
  systemd.sockets.docker.wantedBy = lib.mkForce [ ];
}
