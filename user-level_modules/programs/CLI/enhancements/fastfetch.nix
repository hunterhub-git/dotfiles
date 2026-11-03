{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "none";
        };

        display = {
          color = {
            keys = "blue";          # Will map to soft #70a0a0
            title = "bright_red";     # Will map to soft #e07070
          };
          separator = " ─── ";
        };

        modules = [
          "title"
          "separator"
          { type = "os"; key = "[ OS ]"; }
          { type = "host"; key = "[ HOST ]"; }
          { type = "kernel"; key = "[ KERNEL ]"; }
          { type = "uptime"; key = "[ UPTIME ]"; }
          { type = "packages"; key = "[ PKGS ]"; }
          { type = "shell"; key = "[ SHELL ]"; }
          { type = "terminal"; key = "[ TERM ]"; }
          { type = "cpu"; key = "[ CPU ]"; }
          { type = "gpu"; key = "[ GPU ]"; }
          { type = "memory"; key = "[ RAM ]"; }
          { type = "disk"; key = "[ DISK ]"; }
          "colors"
        ];
      };
    };
  };
}
