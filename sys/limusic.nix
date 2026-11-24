{ pkgs, ... }:
let
  pname = "limusic";
  version = "1.4.1";

  src = pkgs.fetchurl {
    url = "https://github.com/SimoHypers/limusic/releases/download/v${version}/limusic_${version}_amd64.AppImage";
    hash = "sha256-sN96kSnmSNsEH395ovKMybORSQPwYqBwU/z8r0FS/DA=";
  };
  
  contents = pkgs.appimageTools.extract { inherit pname version src; };

  wrappedApp = pkgs.appimageTools.wrapType2 { 
    inherit pname version src;
    nativeBuildInputs = [ pkgs.makeWrapper ];

    extraInstallCommands = ''
      wrapProgram $out/bin/${pname} \
        --set WLR_DRM_NO_MODIFIERS 1

      install -m 444 -D ${contents}/limusic.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/limusic.desktop \
        --replace-fail 'Exec=limusic-app' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share/
    '';
  };
in
{
  users.users.lune.packages = [ wrappedApp ];
}
