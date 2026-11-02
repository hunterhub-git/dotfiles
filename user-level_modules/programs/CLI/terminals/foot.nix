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
          # Deep stealth background with ultra-bright, high-contrast ice text
          background = "0B0F15";
          foreground = "ECF4FF";

          # Bold, saturated tactical ANSI colors
          regular0 = "1E293B"; # Dark Steel / Stealth Black
          regular1 = "FF4B45"; # High-Vis Red (Alarm)
          regular2 = "22C55E"; # Electric Green (Rico's Explosive Success)
          regular3 = "F59E0B"; # Vivid Gold / Yellow (Skipper's Beak)
          regular4 = "0EA5E9"; # Vibrant Tech Blue (Kowalski's Ops)
          regular5 = "D946EF"; # Bold Magenta
          regular6 = "14B8A6"; # Glacial Cyan
          regular7 = "F8FAFC"; # Pure White

          # High-intensity bright variants for maximum visibility
          bright0 = "475569"; # Lighter Steel
          bright1 = "FF6B65"; # Bright Red
          bright2 = "4ADE80"; # Bright Green
          bright3 = "FBBF24"; # Bright Classified Gold
          bright4 = "38BDF8"; # Bright Neon Blue
          bright5 = "E879F9"; # Bright Magenta
          bright6 = "2DD4BF"; # Bright Cyan
          bright7 = "FFFFFF"; # Maximum Bright White
        };
      };
    };
  };
}
