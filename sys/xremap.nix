{ inputs, ... }:
{
  imports = [ inputs.xremap.nixosModules.default ];

  systemd.user.services.xremap = {
    wantedBy = [ "graphical.target" ];
    unitConfig.After = [ "graphical.target" ];
  };
  services.xremap.withWlroots = true;
  services.xremap = {
    enable = true;
    serviceMode = "user";
    userName = "lune";
  };

  services.xremap.config.modmap = [
    {
      name = "sack";
      application.only = [ "steam_app_250900" ];
      remap = {
        "SLASH" = "KEY_UP";
        "COMPOSE"  = "KEY_DOWN";
      };
    }
    {
      name = "global";
      remap = {
        "RIGHTALT"  = "KEY_LEFT";
        "RIGHTCTRL" = "KEY_RIGHT";
      };
    }
  ];
}
