{ config, lib, pkgs, ... }: {

config = lib.mkIf (config.mySystemControlPanel.mediaServices == true ) {

  environment.systemPackages = with pkgs; [
    spotify
    ];
  };
}
