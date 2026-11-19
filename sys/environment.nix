{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    linux-firmware
    linuxHeaders
    intel-media-driver
    libva
    libva-utils
    mesa
    openh264
    vim
    wget
    git
	  gcc
    firefox
    stow
    pam
    libc
    fish
    discord
    zip
    unzip
    nix-search-cli
    bibata-cursors
    bitwarden-cli
    bitwarden-desktop
    ly
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
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    fuzzel
    btop
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      requests
    ]))
    qimgv
    gpu-screen-recorder
    swaylock
    (pywal16.override { withColorz = true; withHaishoku = true; })
    iniparser
    fftw
    killall
    gnome-keyring
    libsecret
    jq
    protonmail-desktop
    vlc
    nordend
    steam
    foot
    tree
    bat
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
