{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # wine/proton
    protonup-qt
    winetricks

    # launchers
    lutris
    heroic

    # emulators
    eden # switch
    rpcs3 # ps3
    vita3k # psvita
    ppsspp # psp
    (retroarch.withCores (
      cores: with cores; [
        np2kai # pc98
      ]
    ))
  ];
}
