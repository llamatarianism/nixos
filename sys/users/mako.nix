{ lib, ... }:
{
  hjem.users.lune.files.".config/mako/config" = {
    generator = lib.generators.toKeyValue { };
    value = {
      background-color = "#fbf1c7ff";
      text-color = "#282828ff";
      border-size = "0";
      border-radius = "12";
      font = "monospace 12";
      margin = "10";
      padding = "10";
      max-icon-size = "32";
      default-timeout = "5000";
      height = "200";
    };
  };
}
