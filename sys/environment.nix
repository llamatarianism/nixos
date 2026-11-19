{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    libva-utils
    vim
    wget
    git
    firefox
    stow
    fish
    discord
    zip
    unzip
    nix-search-cli
    bibata-cursors
    bitwarden-cli
    bitwarden-desktop
    pavucontrol
    playerctl
  	ffmpeg
  	imagemagick
  	gowall
  	yazi
  	adw-gtk3
    gruvbox-gtk-theme
    morewaita-icon-theme
  	nh
  	inputs.limusic.packages.${pkgs.stdenv.hostPlatform.system}.limusic
  	tree-sitter
    fzf
    gimp
    cmatrix
    fuzzel
    btop
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      requests
    ]))
    qimgv
    gpu-screen-recorder
    (pywal16.override { withColorz = true; withHaishoku = true; })
    killall
    gnome-keyring
    jq
    protonmail-desktop
    vlc
    nordend
    foot
    tree
    bat
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
