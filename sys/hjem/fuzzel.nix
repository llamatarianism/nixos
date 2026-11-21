{ lib, ... }:
{
  hjem.users.lune.files.".config/fuzzel/fuzzel.ini" = {
    generator = lib.generators.toINI {};
    value = {
      main = {
        horizontal-pad = 20;
        icon-theme = "MoreWaita";
      };
      colors = {
        background = "fbf1c7ff";
        text = "7c6f64ff";
        border = "7c6f64ff";
        input = "504945ff";
        prompt = "504945ff";
        message = "cc2412ff";
        selection = "ebdbb2ff";
        selection-text = "7c6f64ff";
        selection-match = "d65d0eff";
        match = "d65d0eff";
      };
    };
  };
}
