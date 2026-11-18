{ lib }:
path:
  let
    files = lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") path);

    isUnderscored =
      file:
      let
        relative = lib.removePrefix (toString path + "/") (toString file);
        parts = lib.splitString "/" relative;
      in
        lib.any (part: lib.hasPrefix "_" part) parts;
    in
  lib.filter (file: !isUnderscored file) files
