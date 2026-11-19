{ pkgs, ... }:
{
  users.users."lune" = {
    isNormalUser = true;
    description = "lune";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.fish;
  };
}
