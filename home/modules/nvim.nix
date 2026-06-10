{ config, pkgs, ... }: {
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ../config/nvim;
    recursive = false;
  };

  home.packages = with pkgs; [
    neovim
    git
    gcc
    gnumake
    cargo
    rust-analyzer
    ripgrep
    nodejs
    nixfmt
    wakatime-cli
    tree-sitter
    wl-clipboard
  ];
}
