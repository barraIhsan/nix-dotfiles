{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "xdg-fakehome";
      runtimeInputs = with pkgs; [
        coreutils
        findutils
      ];
      text = builtins.readFile ../scripts/xdg-fakehome;
    })
  ];
}
