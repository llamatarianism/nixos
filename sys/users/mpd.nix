{ inputs, pkgs, ... }:
{
  systemd.packages = with pkgs; [
    mpd
    mpd-mpris
  ];

  systemd.user.services.mpd = {
    enable = true;
  };

  systemd.user.services.mpd-mpris.wantedBy = [ "default.target" ];

  hjem.users.lune.files.".config/mpd/mpd.conf".text = ''
    music_directory "/home/lune/Music"
    audio_buffer_size "512"
    audio_output {
      type "pulse"
      name "Pipewire Pulse"
      always_on "yes"
      buffer_time "50000"
      period_time "12500"
    }
  '';


}

