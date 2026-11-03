{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
