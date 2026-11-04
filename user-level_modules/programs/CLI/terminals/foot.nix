{ config, lib, pkgs, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      # Keep your existing foot settings/parameters here (e.g., font, window padding, etc.)

      colors = {
        alpha = "1.0";
        background = "323d43"; # Everforest Dark Soft background
        foreground = "d3c6aa"; # Everforest foreground

        # Normal/Regular colors
        regular0 = "4b565c"; # black
        regular1 = "e67e80"; # red
        regular2 = "a7c080"; # green
        regular3 = "dbbc7f"; # yellow
        regular4 = "7fbbb3"; # blue
        regular5 = "d699b6"; # magenta
        regular6 = "83c092"; # cyan
        regular7 = "d3c6aa"; # white

        # Bright colors
        bright0 = "4b565c"; # bright black
        bright1 = "e67e80"; # bright red
        bright2 = "a7c080"; # bright green
        bright3 = "dbbc7f"; # bright yellow
        bright4 = "7fbbb3"; # bright blue
        bright5 = "d699b6"; # bright magenta
        bright6 = "83c092"; # bright cyan
        bright7 = "d3c6aa"; # bright white
      };
    };
  };
}
