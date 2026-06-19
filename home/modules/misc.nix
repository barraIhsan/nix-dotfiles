{ pkgs, ... }: {
  home.packages = with pkgs; [
    ente-auth
  ];
  programs.obs-studio = {
    enable = true;
  };
}
