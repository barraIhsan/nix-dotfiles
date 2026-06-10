{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
  };
  home.packages = with pkgs; [
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
