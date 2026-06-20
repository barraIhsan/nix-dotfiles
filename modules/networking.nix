{ ... }: {
  networking = {
    hostName = "nixos";
    # use iwd
    # wireless.iwd.enable = true;

    # enable networking
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };

    # firewall
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        # kde connect
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        # kde connect
        {
          from = 1714;
          to = 1764;
        }
      ];
    };
  };
}
