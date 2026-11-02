{ config, lib, pkgs, ... }: {

  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {

  programs.fd = {
    enable = true;
# Search hidden directories
    hidden = true;
    };
  };
} 
