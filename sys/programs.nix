{ pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.extraPackages = [ pkgs.bibata-cursors ];

  programs.fish.enable = true;

  programs.gpu-screen-recorder = {
    enable = true;
    ui.enable = true;
  };
}
