{ pkgs, ... }:
let
  pname = "limusic";
  version = "1.4.1";

  src = pkgs.fetchurl {
    url = "https://github.com/SimoHypers/limusic/releases/download/v${version}/limusic_${version}_amd64.AppImage";
    hash = "sha256-sN96kSnmSNsEH395ovKMybORSQPwYqBwU/z8r0FS/DA=";
  };
  wrappedApp = pkgs.appimageTools.wrapType2 { inherit pname version src; };
in
{
  users.users.lune.packages = [ wrappedApp ];
}
