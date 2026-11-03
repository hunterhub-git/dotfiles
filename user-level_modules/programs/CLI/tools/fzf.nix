{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      # Everforest Soft Palette FZF Integration
      colors = {
        "bg"      = "#272E33"; # Soft dark background
        "bg+"     = "#30383C"; # Selected background row
        "fg"      = "#D3C6AA"; # Main text (fg)
        "fg+"     = "#FDF6E3"; # Selected text
        "hl"      = "#7FBBB3"; # Highlighted substring (blue)
        "hl+"     = "#83C092"; # Selected highlighted substring (aqua)
        "prompt"  = "#A7C080"; # Prompt symbol (green)
        "pointer" = "#E67E80"; # Current line pointer (red)
        "marker"  = "#DBBC7F"; # Multi-select marker (yellow)
        "spinner" = "#D699B6"; # Streaming indicator (purple)
        "header"  = "#7A8478"; # Header text (grey0)
        "info"    = "#7FBBB3"; # Match counter info (blue)
      };
    };
  };
}
