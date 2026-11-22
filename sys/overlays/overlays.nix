{ config, pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nordend.overlays.default
    (final: prev: {
      microfetch =  (final.callPackage "${inputs.microfetch}/nix/package.nix" { }).overrideAttrs (old: {
        patches = (old.patches or []) ++ [ ./microfetch.patch ];
      });
      nsxiv = prev.nsxiv.overrideAttrs (old: {
        patches = (old.patches or []) ++ [ ./nsxiv.patch ];
      });
    })
  ];
}
