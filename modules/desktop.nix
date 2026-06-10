{ ... }: {
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

  # install firefox.
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
