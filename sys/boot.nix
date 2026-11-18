{
  boot = {
    kernelModules = [ "uinput" ];
    plymouth = {
      enable = true;
      theme = "solar";
    };

    consoleLogLevel = 3;
    kernelParams = [ "quiet" "rd.udev.log_level=3" "rd.systemd.show_status=auto" ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
