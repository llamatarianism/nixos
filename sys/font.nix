{ config, pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.sauce-code-pro
      nerd-fonts.intone-mono
	    cantarell-fonts
      redhat-official-fonts
      inconsolata
      font-awesome
      roboto
      libertinus
	];

  	fontconfig = {
      enable = true;
  	  defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Sometype Mono" "SauceCodePro Nerd Font Propo" ];
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
