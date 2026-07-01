{ config, pkgs, ... }:
{
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

  # modprobe
  boot.extraModprobeConfig = ''
    # disable desaturate color on power saving
    # "Vari-Bright"
    options amdgpu abmlevel=0

    # disable deepcolor
    options nvidia_modeset hdmi_deepcolor=0
  '';

  # enable SysRq
  # https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html
  boot.kernel.sysctl."kernel.sysrq" = 1;

  # extra modules
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  # zram swap
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  # mount /home
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/d7fffbd4-9725-4865-8415-e6cba1317b7d";
    fsType = "ext4";
  };

  systemd.tmpfiles.rules = [
    # enable lenovo's conservation mode (limit at 80% batt)
    "w /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode - - - - 1"
    # disable write permission on home and documents
    "z /home/barra 0500 barra users -"
    "z /home/barra/documents 0500 barra users -"
  ];
}
