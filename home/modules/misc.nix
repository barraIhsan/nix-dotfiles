{ pkgs, inputs, ... }:
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
    picard
    antigravity
    mkvtoolnix
    qdirstat
    qalculate-gtk
    xournalpp
    gparted
  ];

  # syncthing
  services.syncthing = {
    enable = true;
  };
}
