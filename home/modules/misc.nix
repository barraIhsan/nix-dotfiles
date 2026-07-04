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
    pnpm
    inputs.kopuz.packages.${pkgs.system}.default
  ];

  # syncthing
  services.syncthing = {
    enable = true;
  };
}
