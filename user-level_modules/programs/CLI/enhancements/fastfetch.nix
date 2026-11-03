{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "nixos";
        };

        display = {
          separator = " ──> ";
          color = {
            keys = "blue";
            title = "green";
          };
        };

        modules = [
          "title"
          "separator"
          { type = "os"; key = "OS"; }
          { type = "kernel"; key = "Kernel"; }
          { type = "uptime"; key = "Uptime"; }
          { type = "packages"; key = "Packages"; }
          { type = "shell"; key = "Shell"; }
          { type = "terminal"; key = "Terminal"; }
          { type = "cpu"; key = "CPU"; }
          { type = "gpu"; key = "GPU"; }
          { type = "memory"; key = "Memory"; }
          { type = "disk"; key = "Disk"; }
          "break"
          "colors"
        ];
      };
    };
  };
}
