{ config, pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      microfetch = inputs.microfetch.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (o: {
        patches = (o.patches or []) ++ [ ./microfetch.patch ];
      });
    })
  ];
}
