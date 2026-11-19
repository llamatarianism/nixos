{ pkgs, ... }:
{
  users.users.lune.packages = with pkgs; [
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
