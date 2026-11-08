{ config, pkgs, inputs, ... }:

let
  bg = "0B1824";
  fg = "FFFFFF";
in
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.umbriel.nixosModules.default
    ];

  nix.nixPath = [
    "nixos-config=/home/lune/.config/nixos/configuration.nix"
	  "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
	  "/nix/var/nix/profiles/per-user/root/channels"
  ];
  
  boot = {
    plymouth = {
      enable = true;
      theme = "solar";
    };

    consoleLogLevel = 3;
    kernelParams = [ "quiet" "rd.udev.log_level=3" "rd.systemd.show_status=auto" ];
  };

  programs.umbriel.enable = true;
  programs.sway.enable = true;
  programs.dwl.enable = true;

  # systemd slop
  services.flatpak.enable = true;
  services.displayManager.ly = {
    enable = true;
	  settings = { bigclock = "en"; };
  };
  systemd.services.display-manager = {
     serviceConfig = {
	    ExecStartPre = "${pkgs.coreutils}/bin/printf '%%b' '\\e]P0${bg}\\e]P7${fg}\\ec'";
	  };
  };


  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        altgr = "left";
        rightcontrol = "right";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
	  gcc
    firefox
    kitty
    neovim
    fastfetch
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    stow
    zig
    pam
    libc
    fish
    flatpak
    discord
    zip
    unzip
    nix-search-cli
    microfetch
    bibata-cursors
    bitwarden-cli
    bitwarden-desktop
    nwg-look
    keyd
    ly
    pavucontrol
    playerctl
  	lavat
  	pipx
  	ffmpeg
  	imagemagick
  	gowall
  	yazi
  	adw-gtk3
  	bat
  	cowsay
  	cbonsai
  	astroterm
  	pipes
  	asciiquarium
  	peaclock
  	nh
  	inputs.limusic.packages.${pkgs.stdenv.hostPlatform.system}.limusic
  	tree-sitter
    fzf
    gimp
    cmatrix
    sway
    waybar
    i3status-rust
    dwl
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  console.keyMap = "uk";
  
  programs.fish.enable = true;

  users.users."lune" = {
    isNormalUser = true;
    description = "lune";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;


  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.sauce-code-pro
	    cantarell-fonts
      redhat-official-fonts
      inconsolata
	];

	fontconfig = {
      enable = true;
	  defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Red Hat Mono" ];
        sansSerif = [ "Cantarell" ];
        serif = [ "Noto Serif CJK JP" ];
      };
	};
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
