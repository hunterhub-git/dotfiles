{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fish.enable = true;

    programs.starship = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        add_newline = true;
        scan_timeout = 10;

        # Soft Habamax CRT Palette
        palettes.crt-rgb = {
          crt_red = "#d75f5f";
          crt_green = "#70b070";
          crt_blue = "#70a0a0";
          line_dim = "#4e4e4e";
          text_bright = "#d0d0d0";
        };

        palette = "crt-rgb";

        # Balanced retro linework layout
        format = lib.concatStrings [
          "[╭─](crt_blue) "
          "$os"
          " [│](line_dim) "
          "$username"
          " [│](line_dim) "
          "$directory"
          " [│](line_dim) "
          "$git_branch"
          "$git_status"
          "\n"
          "[╰─❯](crt_green bold) "
        ];

        os = {
          disabled = false;
          style = "crt_blue bold";
          symbols = {
            NixOS = "NIX";
            Linux = "LINUX";
          };
        };

        username = {
          show_always = true;
          style_user = "crt_red bold";
          format = "[$user]($style)";
        };

        directory = {
          style = "text_bright";
          format = "[$path]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };

        git_branch = {
          style = "crt_green";
          format = "[$symbol$branch]($style)";
          symbol = "⎇ ";
        };

        git_status = {
          style = "crt_green";
          format = "[$all_status$ahead_behind]($style)";
        };
      };
    };
  };
}
