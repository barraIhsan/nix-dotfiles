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
    spek
  ];

  # syncthing
  services.syncthing = {
    enable = true;
  };

  # gtk config
  # Breeze GTK weird combobox menu scroll arrow bug at certain font sizes
  # https://www.reddit.com/r/kde/comments/1ky6b41/has_anyone_found_a_fix_for_the_gtk_breeze/muuuc2u/
  xdg.configFile."gtk-3.0/gtk.css".source = ../config/gtk/gtk-3.0/gtk.css;
}
