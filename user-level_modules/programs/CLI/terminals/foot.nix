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
  background = "272E33"; # Soft Everforest bg0
  foreground = "D3C6AA"; # fg

  regular0 = "30383C"; # Soft dark neutral
  regular1 = "E67E80"; # Red
  regular2 = "A7C080"; # Green
  regular3 = "DBBC7F"; # Yellow
  regular4 = "7FBBB3"; # Blue
  regular5 = "D699B6"; # Purple
  regular6 = "83C092"; # Aqua
  regular7 = "D3C6AA"; # White / FG

  bright0  = "7A8478"; # grey0
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
