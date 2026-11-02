{ config, lib, pkgs, ...}: {

  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {

  programs.fish.enable = true;

 programs.zoxide = { 
   enable = true;
 
 # Whether to integrate into fish
 enableFishIntegration = true;
    };
  };
}
