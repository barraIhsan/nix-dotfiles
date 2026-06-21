{ pkgs, ... }: {
  # enable plasma and sddm
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # cups for printing
  services.printing.enable = true;

  # brightness/backlit
  environment.systemPackages = [
    pkgs.ddcutil
    pkgs.brightnessctl
  ];
  hardware.i2c.enable = true;

  # install firefox.
  # for some reason when i use wired mode on my mouse (ATK A9 SE)
  # there's one device/event that acts as a keyboard that'll hold right alt
  # thus disabling me typing normally cuz the right alt is being held
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1135", ENV{ID_INPUT_KEYBOARD}=="1", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
  programs.firefox.enable = true;

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
