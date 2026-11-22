{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    libva-utils
    vim
    wget
    git
    stow
    fish
    zip
    unzip
    nix-search-cli
    pavucontrol
    playerctl
  	ffmpeg
  	imagemagick
  	nh
  	tree-sitter
    fzf
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      requests
    ]))
    gpu-screen-recorder
    killall
    gnome-keyring
    jq
    vlc
    foot
    tree
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
