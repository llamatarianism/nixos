let
  gtk-settings = {
    Settings = {
      gtk-theme-name = "Gruvbox-Light";
      gtk-icon-theme-name = "MoreWaita";
      gtk-font-name = "Adwaita Sans 11";
      gtk-cursor-theme-name = "Bibata-Modern-Classic";
      gtk-cursor-theme-size = "24";
      gtk-sound-theme-name = "freedesktop";
      gtk-error-bell = "1";
      gtk-application-prefer-dark-theme = "0";
    };
  };
in
{
  hjem.users.lune.files.".config/gtk-3.0/settings.ini" = {
    generator = lib.generators.toINI {};
    value = gtk-settings;
  };
  hjem.users.lune.files.".config/gtk-4.0/settings.ini" = {
    generator = lib.generators.toINI {};
    value = gtk-settings;
  };
}

