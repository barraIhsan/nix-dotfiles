{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];
  programs.steam = {
    enable = true;
    # hash mismatch issue currently
    # package = pkgs.millennium-steam;
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
