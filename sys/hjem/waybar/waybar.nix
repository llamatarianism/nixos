{
  hjem.users.lune.files.".config/waybar/style.css".source = ./style.css;

  hjem.users.lune.files.".config/waybar/config.jsonc" = {
    generator = builtins.toJSON;
    value = {
      on_sigusr1 = "reload";
      layer = "top"; 
      position = "bottom";
      height = 30; 
      spacing = 4;
      modules-left = [
        "umbriel/workspaces"
        "umbriel/window"
    ];
    modules-center = [
        "mpris"
    ];
    modules-right = [
        "group/tray"
        "custom/weather"
        "custom/sep"
        "pulseaudio"
        "custom/sep"
        "memory"
        "custom/sep"
        "clock"
    ];

    "umbriel/workspaces" = {
        format = "{index}";
        hide-empty = true;
    };
    "umbriel/window" = {
        format = "{title}";
        max-length = 70;
        rewrite = {
            "(.*) — Mozilla Firefox" = "󰈹 $1";
            "(.*) - Discord" = " $1";
            "(.*) – GIMP" = " $1";
            "Limusic" = "󰐎 Limusic";
            "vim (.*)" = " $1";
            "Steam" = " Steam";
            "Steam (.*)"  = " $1";
        };
    };
    tray = {
        spacing = 10;
    };
    clock = {
        format = "{0:%H:%M %Z} ";
        format-alt = "{0:%d %b %Y} ";
        tooltip = false;
    };
    "clock#date" = {
        format = "{0:%d %b %Y}";
    };
    cpu = {
        format = "{usage}% ";
        tooltip = false;
    };
    memory = {
        format = " {used:0.1f}G";
    };
    network = {
        format-wifi = "{icon}";
        format-ethernet = "{cidr} 󰊗";
        tooltip-format = "{essid}: {signalStrength}%";
        format-disconnected = "󰤮";
        format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
        
    };
    pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " X%";
        tooltip-format = "Volume: {volume}%";
        format-icons = {
           default = [ "" "" "" "" ];
        };
        on-click = "pavucontrol";
        on-click-right = "pactl set-sink-mute 0 toggle";
        scroll-step = 2;
    };
    "custom/power" = {
      "format"  = " ";
      on-click = "$HOME/scripts/power_menu.sh";
    };
    "custom/weather" = {
      format = "{text}";
      exec = "weather";
      interval = 120;
    };
    mpris = {
      format = " {dynamic}";
      dynamic-order = ["artist" "title"];
      max-length = 100;
    };
    "custom/sep" = {
      format = "/";
    };
    "custom/drawer" = {
      format = "";
    };
    "group/tray" = {
      orientation = "horizontal";
      modules = [
        "custom/drawer"
        "tray"
      ];
      drawer = {
        click-to-reveal = true;
        transition-duration = 100;
      };
    };
  };
};
}
