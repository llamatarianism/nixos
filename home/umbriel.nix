{ inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [
        "waybar"
        "mako"
        "keyd-application-mapper -dv"
        "bw serve --hostname 127.0.0.1 --port 8087"
        "$HOME/scripts/wallpaper_random.sh"
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
          default_floating_size_px = { width = 576; height = 600 };
          default_position = { x = 112; y = 0; anchor = "center" };
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
      };
    };
  };
}
