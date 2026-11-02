{ config, lib, pkgs, ... }: {

  config = lib.mkIf ( config.myUserControlPanel.terminalTools == true) {

  programs.eza = {
    enable = true;
#Whether to enable eza for fish
enableFishIntegration = true;

# Whether to enable eza for git
git = true;

# Extra eza Options
    extraOptions = [
      "--group-directories-first"
      "--header"
      ];
    };
  };
}
