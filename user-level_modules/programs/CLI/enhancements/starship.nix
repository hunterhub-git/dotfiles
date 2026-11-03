}{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fish.enable = true;

    programs.starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        add_newline = true;
        scan_timeout = 10;

        # Modern Rounded Powerline Block Layout
        format = lib.concatStrings [
          "[](#7FBBB3)"
          "$os"
          "[](bg:#434F55 fg:#7FBBB3)"
          "$directory"
          "[](bg:#3A464C fg:#434F55)"
          "$git_branch"
          "$git_status"
          "[](fg:#3A464C) "
          "\n$character"
        ];

        os = {
          disabled = false;
          style = "bg:#7FBBB3 fg:#333C43 bold";
          symbols = {
            NixOS = " ❄️ NIX ";
            Linux = " 🐧 LINUX ";
          };
        };

        directory = {
          style = "bg:#434F55 fg:#D3C6AA";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        git_branch = {
          style = "bg:#3A464C fg:#A7C080 bold";
          format = "[ $symbol$branch ]($style)";
          symbol = " ⎇ ";
        };

        git_status = {
          style = "bg:#3A464C fg:#DBBC7F";
          format = "[ $all_status$ahead_behind ]($style)";
        };

        character = {
          success_symbol = "[❯](bold #A7C080)";
          error_symbol = "[❯](bold #E67E80)";
        };
      };
    };
  };
}
