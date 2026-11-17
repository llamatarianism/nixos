{ config, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [ "umbriel" "gtk" ];
      "org.freedesktop.imp.portal.FileChooser" = [ "nordend" ];
    };
  };
}
