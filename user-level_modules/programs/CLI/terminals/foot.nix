{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.defaultTerminal == "foot") {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          dpi-aware = "yes";
          term = "foot";
        };

        mouse = {
          hide-when-typing = "yes";
        };

        colors-dark = {
          # Exact match to Neovim's guibg=#121212
          background = "121212";
          foreground = "d0d0d0";

          # Soft Muted ANSI Colors (Habamax Palette)
          regular0 = "1f1f1f"; # Dark Neutral / Selection
          regular1 = "d75f5f"; # Soft Habamax Red
          regular2 = "70b070"; # Soft Habamax Green
          regular3 = "af875f"; # Soft Warm Amber / Tan
          regular4 = "70a0a0"; # Soft CRT Cyan-Blue
          regular5 = "af87af"; # Soft Lavender Magenta
          regular6 = "5f8787"; # Muted Slate Cyan
          regular7 = "d0d0d0"; # Soft Off-White

          # Bright ANSI Variants
          bright0  = "4e4e4e"; # Muted Gray
          bright1  = "e07070"; # Bright Soft Red
          bright2  = "80c080"; # Bright Soft Green
          bright3  = "c0a070"; # Bright Muted Gold
          bright4  = "80b5b5"; # Bright Soft Blue
          bright5  = "c095c0"; # Bright Soft Lavender
          bright6  = "709f9f"; # Bright Soft Cyan
          bright7  = "ffffff"; # Bright Pure White
        };
      };
    };
  };
}
