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
    inputs.kopuz.packages.${pkgs.system}.default
    mkvtoolnix
    qdirstat
  ];

  # syncthing
  services.syncthing = {
    enable = true;
  };
}
