{ pkgs, ... }:
{
  users.users.lune.packages = with pkgs; [
    mako
    waybar
    swaybg
    nsxiv
    foot
    fuzzel
    wl-clipboard
    grim
    slurp
    libnotify
    nwg-look
    swaylock
    microfetch
    lavat
    cowsay
    cbonsai
    astroterm
    pipes
    asciiquarium
    peaclock
    cmatrix
    terminal-rain-lightning
    cava
  ];
}
