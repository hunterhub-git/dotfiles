{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      # Default command using ripgrep if available for fast file search
      defaultCommand = "rg --files --hidden --follow --glob '!.git/*'";

      # Default options
      defaultOptions = [
        "--height 50%"
        "--border rounded"
        "--layout reverse"
        "--info inline"
        "--prompt='🔍 '"
        "--pointer='▶'"
        "--marker='✓'"
        # Custom color override
        "--color=bg:#1d2021,bg+:#282828,spinner:#00ff66,hl:#00ccff"
        "--color=fg:#d0d0d0,header:#ffcc00,info:#ff4444,pointer:#00ff66"
        "--color=marker:#00ff66,prompt:#00ccff,hl+:#00ccff"
        # Optional: live file preview using bat if you want file contents shown on the side
        "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
      ];
    };
  };
}
