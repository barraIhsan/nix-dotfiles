{ pkgs, inputs, ... }: {
  programs.steam = {
    enable = true;
    # proton ge
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    # protontricks
    protontricks.enable = true;
  };

  # gamemode
  programs.gamemode.enable = true;

  # protonup
  environment.systemPackages = [ pkgs.protonup-qt ];
}
