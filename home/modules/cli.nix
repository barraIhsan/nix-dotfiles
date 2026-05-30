{ config, ... }:
{
  # zsh
  xdg.configFile = {
    "zsh/.zshrc".source = ../config/zsh/zshrc;
    "zsh/.zshenv".source = ../config/zsh/zshenv;
  };

  # starship
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory $fill $status $all$character";

      # Seperate left and right
      fill.symbol = " ";

      # Exit Code in bold red
      status = {
        style = "bold red";
        format = "[$status]($style)";
        disabled = false;
      };

      directory = {
        format = "[$path]($style) [$read_only]($read_only_style)";
        read_only = "";
      };
    };
  };

  # fastfetch
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source = ../config/fastfetch/config.jsonc;

  # tmux
  programs.tmux.enable = true;
  xdg.configFile."tmux/tmux.conf".source = ../config/tmux/tmux.conf;

  # yt-dlp
  programs.yt-dlp.enable = true;
  xdg.configFile."yt-dlp/config".source = ../config/yt-dlp/config;

  # fzf
  programs.fzf.enable = true;

  # zoxide (cd)
  programs.zoxide.enable = true;

  # eza (ls)
  programs.eza.enable = true;
  
  # bat (cat)
  programs.bat.enable = true;
  
  # yazi
  programs.yazi.enable = true;
}
