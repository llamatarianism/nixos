{
  nixpkgs.overlays = [
    (final: prev: {
      microfetch = prev.microfetch.overrideAttrs (o: {
	      src = final.fetchFromGitHub {
          owner = "NotAShelf";
		      repo = "microfetch";
		      hash = "sha256-akJ44+X1POnV1dZnWq66X5vWokp9TGgJ5/Ey6kh/icA=";
		      tag = "1.1.0";
		    };
        patches = (o.patches or []) ++ [ ./microfetch.patch ];
      });
    })
  ];
}
