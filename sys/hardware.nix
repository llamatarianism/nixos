{ pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ 
      intel-media-driver 
      vpl-gpu-rt
    ];
  };
  hardware.uinput.enable = true;
}
