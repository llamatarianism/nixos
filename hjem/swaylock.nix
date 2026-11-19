{ lib, ... }:
{
  hjem.users.lune.files.".config/swaylock/config" = {
    generator = lib.generators.toKeyValue {
      mkKeyValue = k: v: if v == true then k else "${k}=${toString v}";
    };
    value = {
        color = "ebdbb2";
        font = "Sometype Mono";
        font-size = 40;
        scaling = "fill" ;
        indicator-radius = 200;
        indicator-thickness = 30;
        indicator-idle-visible = true;
        bs-hl-color = "ffa066";
        caps-lock-bs-hl-color = "ffa066";
        caps-lock-key-hl-color = "957fbb";
        inside-color = "fbf1c7";
        inside-clear-color = "fbf1c7";
        inside-caps-lock-color = "fbf1c7";
        inside-ver-color = "fbf1c7";
        inside-wrong-color = "fbf1c7";
        key-hl-color = "689d6a";
        layout-bg-color = "fbf1c7";
        layout-border-color = "fbf1c7";
        layout-text-color = "dcd7ba";
        line-color = "fbf1c7";
        line-clear-color = "fbf1c7";
        line-caps-lock-color = "fbf1c7";
        line-ver-color = "fbf1c7";
        line-wrong-color = "fbf1c7";
        ring-color = "fbf1c7";
        ring-clear-color = "ffa066";
        ring-caps-lock-color = "cc2412";
        ring-ver-color = "98971a";
        ring-wrong-color = "cc2412";
        separator-color = "00000000";
        text-color = "282828";
        text-clear-color = "ffa066";
        text-caps-lock-color = "d65d0e";
        text-ver-color = "282828";
        text-wrong-color = "cc2412";
    };
  };
}
