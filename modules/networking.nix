{ ... }: {
  networking.hostName = "nixos";
  # use iwd
  # networking.wireless.iwd.enable = true;

  # Enable networking
  networking.networkmanager = {
    enable = true;
    # wifi.backend = "iwd";
  };
}
