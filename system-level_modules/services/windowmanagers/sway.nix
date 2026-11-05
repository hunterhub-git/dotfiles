{ config, lib, options, ... }: {

  config = lib.mkIf (config.mySystemControlPanel.defaultWindowManager == "sway") {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    };
    services.xserver.enable = true;
  };
}
    
