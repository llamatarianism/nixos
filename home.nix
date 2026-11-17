{ config, pkgs, inputs, ... }:
{
  imports = [ ./neovim.nix ];
  home.stateVersion = "26.11";
}
