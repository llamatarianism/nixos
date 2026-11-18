{ pkgs, ... }:
{
  users.users."lune" = {
    isNormalUser = true;
    description = "lune";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}
