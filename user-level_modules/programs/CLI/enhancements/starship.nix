{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fish.enable = true;

    programs.starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        add_newline = true;
        scan_timeout = 10;

        # Define our Penguins of Madagascar bold color palette
        palettes.penguin-ops = {
          bg_dark = "#0B0F15";
          ice_blue = "#0EA5E9";
          tuxedo_black = "#1E293B";
          skipper_gold = "#F59E0B";
          rico_green = "#22C55E";
          snow_white = "#ECF4FF";
          magenta_glow = "#D946EF";
        };

        palette = "penguin-ops";

        # Detailed modular prompt line layout
        format = lib.concatStrings [
          "[](ice_blue)"
          "$os"
          "$username"
          "[](bg:tuxedo_black fg:ice_blue)"
          "$directory"
          "[](bg:skipper_gold fg:tuxedo_black)"
          "$git_branch"
          "$git_status"
          "[](bg:rico_green fg:skipper_gold)"
          "$c"
          "$rust"
          "$golang"
          "$nodejs"
          "[](bg:magenta_glow fg:rico_green)"
          "$time"
          "[ ](fg:magenta_glow)"
          "$character"
        ];

        os = {
          disabled = false;
          style = "bg:ice_blue fg:bg_dark";
          symbols = {
            NixOS = " 🐧 ";
            Linux = " 🐧 ";
          };
        };

        username = {
          show_always = true;
          style_user = "bg:ice_blue fg:bg_dark bold";
          format = "[ $user ]($style)";
        };

        directory = {
          style = "bg:tuxedo_black fg:snow_white bold";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        git_branch = {
          style = "bg:skipper_gold fg:bg_dark bold";
          symbol = "  ";
          format = "[ $symbol$branch ]($style)";
        };

        git_status = {
          style = "bg:skipper_gold fg:bg_dark";
          format = "[$all_status$ahead_behind ]($style)";
        };

        c = {
          symbol = "C ";
          style = "bg:rico_green fg:bg_dark";
          format = "[ $symbol($version) ]($style)";
        };

        rust = {
          symbol = "🦀 ";
          style = "bg:rico_green fg:bg_dark";
          format = "[ $symbol($version) ]($style)";
        };

        nodejs = {
          symbol = "⬢ ";
          style = "bg:rico_green fg:bg_dark";
          format = "[ $symbol($version) ]($style)";
        };

        time = {
          disabled = false;
          time_format = "%T";
          style = "bg:magenta_glow fg:bg_dark bold";
          format = "[  $time ]($style)";
        };

        character = {
          success_symbol = "[❯](bold ice_blue)";
          error_symbol = "[#ERROR#](bold.bright-red)";
        };
      };
    };
  };
}
