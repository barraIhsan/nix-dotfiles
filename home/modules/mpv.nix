{ inputs, pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      mpris
      webtorrent-mpv-hook
    ];
  };

  # my own config
  xdg.configFile."mpv/mpv.conf".source = ../config/mpv/mpv.conf;
  xdg.configFile."mpv/input.conf".source = ../config/mpv/input.conf;
  xdg.configFile."mpv/scripts" = {
    source = ../config/mpv/scripts;
    recursive = true;
  };
  xdg.configFile."mpv/script-opts" = {
    source = ../config/mpv/script-opts;
    recursive = true;
  };

  # gandhi sans font
  xdg.configFile."mpv/fonts" = {
    recursive = true;
    source =
      let
        gandhi = pkgs.fetchzip {
          url = "https://mirrors.ctan.org/fonts/gandhi.zip";
          hash = "sha256-YYZqLgIwwLzh4xqRyVQT/UpS3FG5PxAOWt7ctDl0i/4=";
        };
      in
      "${gandhi}/opentype";
  };

  # other scripts
  # videoclip
  xdg.configFile."mpv/scripts/videoclip".source =
    pkgs.runCommand "videoclip" { nativeBuildInputs = [ pkgs.patch ]; }
      ''
        cp -r ${inputs.videoclip}/. "$out"
        chmod -R u+w "$out"
        patch -p1 -d "$out" < ${../config/mpv/patches/videoclip.diff}
      '';
  # hold space to set 2x speed
  xdg.configFile."mpv/scripts/hold-speed.lua".source = "${inputs.hold-speed}/hold_speed.lua";
  # seek to
  xdg.configFile."mpv/scripts/seek-to.lua".source = "${inputs.seek-to}/scripts/seek-to.lua";
  # thumbfast
  xdg.configFile."mpv/scripts/thumbfast.lua".source = "${inputs.thumbfast}/thumbfast.lua";
  # visualizer
  xdg.configFile."mpv/scripts/visualizer.lua".source = "${inputs.visualizer}/visualizer.lua";
}
