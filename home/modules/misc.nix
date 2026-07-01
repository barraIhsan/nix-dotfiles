{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ente-auth
    tauon
    qbittorrent
    davinci-resolve
    nicotine-plus
    obsidian
    prismlauncher
    eden
    osu-lazer-bin
    pnpm
  ];

  # syncthing
  services.syncthing = {
    enable = true;
  };
}
