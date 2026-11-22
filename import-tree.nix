{ lib }:
path:
  path
  |> lib.fileset.fileFilter (file: file.hasExt "nix")
  |> lib.fileset.toList
  |> lib.filter (
    file:
    toString file
    |> lib.removePrefix "${toString path}/"
    |> lib.splitString "/"
    |> lib.all (part: !lib.hasPrefix "_" part)
  )
