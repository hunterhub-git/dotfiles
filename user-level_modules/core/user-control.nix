{ config, lib, pkgs, ... }: {
  options.myUserControlPanel = {
    defaultEditor = lib.mkOption {
      type = lib.types.str;
      description = "Sets the user-space default core text editor.";
    };
    defaultTerminal = lib.mkOption {
      type = lib.types.str;
      description = "Sets the user-space default temrinal.";
    };
    terminalEnhancements = lib.mkOption {
      type = lib.types.bool;
      description = "Enables terminal enhancements for the selected terminal.";
    };
    terminalTools = lib.mkOption {
      type = lib.types.bool;
      description = "Enables terminal tools for the selected terminal.";
    };
    developmentTools = lib.mkOption {
      type = lib.types.bool;
      description = "Enable developement tools for the selected terminal.";
    };
};

  config = {
    # Modifies the home session variables
    home.sessionVariables = {
      EDITOR = config.myUserControlPanel.defaultEditor;
      TERMINAL = config.myUserControlPanel.defaultTerminal;
    };
  };
}
