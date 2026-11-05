{ config, lib, options, ... }: {

config = lib.mkIf (config.mySystemControlPanel.defaultDisplayManager == "lightdm") {

services.xserver.displayManager.lightdm.enable = true;
services.displayManager.defaultSession = "sway";

  };
}
