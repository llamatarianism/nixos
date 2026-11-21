{ pkgs, lib, ... }:
let
  common = with pkgs; [ curl jq grim slurp wl-clipboard swaybg swaylock fuzzel nsxiv bitwarden-cli ];

  scripts = lib.filterAttrs
    (name: type: type == "regular" && lib.hasSuffix ".sh" name)
    (builtins.readDir ./scripts);

  packages = lib.mapAttrsToList (name: _:
    pkgs.writeShellApplication {
      name = lib.removeSuffix ".sh" name;
      runtimeInputs = common;
      text = builtins.readFile (./scripts + "/${name}");
    }
  ) scripts;
in
{
  users.users.lune.packages = packages;
}
