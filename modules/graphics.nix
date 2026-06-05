{
  ...
}:
{
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
    enable = true;
    open = true;
    modesetting.enable = true;

    prime = {
      offload.enable = true;
      enableOffloadCmd = true;
      amdgpuBusId = "PCI:53@0:0.0";
      nvidiaBusId = "PCI:1@0:0.0";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
