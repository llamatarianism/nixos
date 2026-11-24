{ pkgs, ... }:
{
  hjem.users.lune.files.".config/umbriel/config.toml".source = (pkgs.formats.toml {}).generate "foo" {
    general.autostart = [
      "waybar"
      "mako"
      "keyd-application-mapper -dv"
      "bw serve --hostname 127.0.0.1 --port 8087"
      "wallpaper_random"
      "foot --server"
    ];
    general.show_cheatsheet = false;
    
    input = {
      keyboard.layout = "gb";
      focus.follows_mouse = "sloppy";
    };

    output."LG Electronics LG ULTRAGEAR 103NTVSGK735" = {
      mode = "2560x1440@144";
      workspace_axis = "horizontal";
      min_workspaces = 3;
    };

    layout = {
      mode = "dwindle";
      gap = 20;
      dwindle.new_toward_cursor = true;
    };

    window_rule = [
      {
        blur = true;
        blur_optimized = false;
      }
      {
        match.app_id = "steam";
        default_floating = true;
      }
      {
        match.title = "Steam";
        default_floating = false;
      }
      {
        match.title = "nsxiv";
        default_floating = true;
        default_floating_size_px = { width = 576; height = 600; };
        default_position = { x = 112; y = 0; anchor = "center"; };
      }
      {
        match.app_id = "limusic";
        blur = false;
      }
    ];

    overview = {
      background_blur = false;
      workspace_wallpaper = false;
      shortcuts = false;
    };

    colors.overview = {
      workspace_background = "#ffffff00";
      background_tint = "#ffffff00";
    };

    appearance = {
      corner_radius = 12;
      border_width  = 0;
      drag_opacity  = 0.4;
      blur.radius = 3;
    };


    animation = {
      beziers = {
        md3_standard = [ 0.2  0.0 0.0 1.0  ];
        md3_decel    = [ 0.05 0.7 0.1 1.0  ];
        md3_accel    = [ 0.3  0.0 0.8 0.15 ];
      };

      windows_in = {
        style = "zoom";
        curve = "md3_decel";
        duration_ms = 300;
        scale = 0.85;
      };

      windows_out = {
        curve = "md3_accel";
        duration_ms = 150;
      };

      windows_move = {
        curve = "md3_standard";
        duration_ms = 200;
      };

      workspaces = {
        curve = "md3_standard";
        duration_ms = 300;
      };

      layers = {
        curve = "md3_decel";
        duration_ms = 300;
      };
    };

    keybinds = {
      "Mod"           = "overview-toggle";
      "Mod+Q"         = "spawn footclient";
      "Mod+C"         = "window-close";
      "Mod+R"         = "spawn launcher";
      "Mod+D"         = "spawn power_menu";
      "Mod+E"         = "spawn quick_edit";
      "Mod+Y"         = "spawn foot -e yazi";
      "Mod+A"         = "spawn noctalia msg panel-toggle clipboard";
      "Mod+W"         = "spawn wallpaper_selector";
      "Mod+Shift+W"   = "spawn wallpaper_random";
      "Mod+WheelUp"   = "workspace-previous";
      "Mod+WheelDown" = "workspace-next";
      "Mod+L"         = "spawn swaylock" ;
      "Mod+P"         = "spawn bitwarden_server";
      "Mod+S"         = "spawn screenshot";
      "Mod+Shift+S"   = "spawn screenshot 1";
      "Mod+Tab"       = "spawn playerctl next";
      "Mod+Backspace" = "spawn playerctl previous";
      "Mod+Space"     = "spawn playerctl play-pause";
      "Mod+Alt+Right" = "column-focus-tab-next";
      "Mod+V"         = "window-toggle-floating";
      "Mod+M"         = "window-toggle-maximize-to-edges";
      "Mod+F"         = "window-toggle-fullscreen";
      "Mod+J"         = "window-swap-next";
      "Mod+1"         = "workspace-switch 1";
      "Mod+2"         = "workspace-switch 2";
      "Mod+3"         = "workspace-switch 3";
      "Mod+4"         = "workspace-switch 4";
      "Mod+5"         = "workspace-switch 5";
      "Mod+6"         = "workspace-switch 6";
      "Mod+7"         = "workspace-switch 7";
      "Mod+8"         = "workspace-switch 8";
      "Mod+9"         = "workspace-switch 9";
      "Mod+Shift+1"   = "window-move-to-workspace 1";
      "Mod+Shift+2"   = "window-move-to-workspace 2";
      "Mod+Shift+3"   = "window-move-to-workspace 3";
      "Mod+Shift+4"   = "window-move-to-workspace 4";
      "Mod+Shift+5"   = "window-move-to-workspace 5";
      "Mod+Shift+6"   = "window-move-to-workspace 6";
      "Mod+Shift+7"   = "window-move-to-workspace 7";
      "Mod+Shift+8"   = "window-move-to-workspace 8";
      "Mod+Shift+9"   = "window-move-to-workspace 9";
    };
  };
}
