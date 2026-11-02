{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {
    programs.bat = {
      enable = true;
      
      # Configuration settings for bat
      config = {
        # Use a high-contrast dark theme matching our arctic palette
        theme = "TwoDark";
        
        # Show line numbers, git modifications, and grid decorations
        style = "full";
        
        # Disable side header wrapping for clean code output
        wrap = "never";
      };
    };
  };
}
