{ config, pkgs, ... }:
let
  bg = "282828";
  fg = "FBF1C7";
in
{
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  '';

  services.displayManager.ly = {
    enable = true;
	  settings = { bigclock = "en"; };
  };
  systemd.services.display-manager = {
     serviceConfig = {
	    ExecStartPre = "${pkgs.coreutils}/bin/printf '%%b' '\\e]P0${bg}\\e]P7${fg}\\ec'";
	  };
  };
  
  services.dbus.enable = true;
  
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  services.gnome.gnome-keyring.enable = true;

}
