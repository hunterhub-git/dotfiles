{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          # Automatically uses the default built-in NixOS graphic logo
          type = "auto";
        };

        display = {
          color = {
            keys = "blue";
            title = "bright_yellow";
          };
          separator = " 🐧 ";
        };

        modules = [
          "title"
          "separator"
          {
            type = "os";
            key = "Operation";
          }
          {
            type = "host";
            key = "HQ Unit";
          }
          {
            type = "kernel";
            key = "Core Base";
          }
          {
            type = "uptime";
            key = "Mission Time";
          }
          {
            type = "packages";
            key = "Arsenal";
          }
          {
            type = "shell";
            key = "Comms";
          }
          {
            type = "terminal";
            key = "Terminal";
          }
          {
            type = "cpu";
            key = "Processor";
          }
          {
            type = "gpu";
            key = "Visual Intel";
          }
          {
            type = "memory";
            key = "RAM Status";
          }
          {
            type = "swap";
            key = "Backup Vault";
          }
          {
            type = "disk";
            key = "Storage Vault";
          }
          {
            type = "localip";
            key = "Network Frequency";
          }
          {
            type = "colors";
            symbol = "circle";
          }
        ];
      };
    };
  };
}

