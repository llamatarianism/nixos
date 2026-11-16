{ config, pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nordend.overlays.default
    (final: prev: {
      microfetch = inputs.microfetch.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
        patches = (old.patches or []) ++ [ ./microfetch.patch ];
      });
    })
    (final: prev: {
      nsxiv = prev.nsxiv.overrideAttrs (old: {
        patches = (old.patches or []) ++ [ ./nsxiv.patch ];
      });
    })
  ];
}
