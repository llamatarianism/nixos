{ config, pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.sauce-code-pro
      nerd-fonts.intone-mono
      alegreya
	    cantarell-fonts
      font-awesome
      libertinus
      google-fonts
	];

  	fontconfig = {
      enable = true;
  	  defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "IntoneMono NFP" "SauceCodePro Nerd Font Propo" ];
        sansSerif = [ "Cantarell" "Roboto" "Noto Sans" ];
        serif = [ "Noto Serif CJK JP" ];
      };
      useEmbeddedBitmaps = true;

      hinting = {
        enable = true;
        style = "full";
      };

      subpixel.rgba = "rgb";
  	};
  };
}
