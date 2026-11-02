{ config, lib, pkgs, ... }: {

  config = lib.mkIf (config.myUserControlPanel.defaultEditor == "vim" ) {

  programs.vim = {
    enable = true;

 # 1. Vim Configuration
   settings = {
   background = "dark";
   copyindent = true;
   mousefocus = true;
   number = true;
   relativenumber = true;
   shiftwidth = 4;
   smartcase = true;
      };
    };
  };
}
