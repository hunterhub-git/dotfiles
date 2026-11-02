{ config, lib, pkgs, ... }: {

  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {

  programs.ripgrep = {
  enable = true;
     };
    };
  }
