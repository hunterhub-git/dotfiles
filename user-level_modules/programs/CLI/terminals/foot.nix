{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.defaultTerminal == "foot") {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          dpi-aware = true;
          term = "foot";
        };

        mouse = {
          hide-when-typing = true;
        };

        colors-dark = {
          background = "272E33"; # Soft Everforest bg0
          foreground = "D3C6AA"; # fg

          regular0 = "30383C";
          regular1 = "E67E80";
          regular2 = "A7C080";
          regular3 = "DBBC7F";
          regular4 = "7FBBB3";
          regular5 = "D699B6";
          regular6 = "83C092";
          regular7 = "D3C6AA";

          bright0  = "7A8478";
          bright1  = "E67E80";
          bright2  = "A7C080";
          bright3  = "DBBC7F";
          bright4  = "7FBBB3";
          bright5  = "D699B6";
          bright6  = "83C092";
          bright7  = "FDF6E3";
        };
      };
    };
  };
}
