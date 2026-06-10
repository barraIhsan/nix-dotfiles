{ pkgs, ... }: {
  boot.loader = {
    # systemd-boot
    systemd-boot = {
      enable = true;
      # max 5 nix generation shown
      configurationLimit = 5;
    };

    # instant (press space to access the boot menu)
    timeout = 0;
    efi.canTouchEfiVariables = true;
  };

  # use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # enable SysRq
  # https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # zram swap
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
}
