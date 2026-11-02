{ config, lib, pkgs, ... }: {
  options.mySystemControlPanel = {
    defaultShell = lib.mkOption {
      type = lib.types.str;
      description = "Sets the system-space shell.";
      };
    systemAudio = lib.mkOption {
      type = lib.types.str;
      description = "Sets the system-space audio processing service.";
      };
    mediaServices = lib.mkOption {
      type = lib.types.bool;
      description = "Enables system-space media services.";
      };
    };

    config = {
    users.users.hunter = {
      isNormalUser = true;
      shell = 
        if config.mySystemControlPanel.defaultShell == "fish" then pkgs.fish
        else if config.mySystemControlPanel.defaultShell == "bash" then pkgs.bash
        else pkgs.bash;
      };
    };
  }
