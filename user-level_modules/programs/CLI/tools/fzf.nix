{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalTools == true) {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      # Default command using ripgrep if available for blazing fast file search
      defaultCommand = "rg --files --hidden --follow --glob '!.git/*'";

      # Default options styled with our custom theme and bat preview integration
      defaultOptions = [
        "--height 50%"
        "--border rounded"
        "--layout reverse"
        "--info inline"
        "--prompt='🐧 ❯ '"
        "--pointer='▶'"
        "--marker='✓'"
        # Custom color overrides mapping to your exact arctic theme palette
        "--color=bg+:#1E293B,bg:#0B0F15,spinner:#D946EF,hl:#0EA5E9"
        "--color=fg:#ECF4FF,header:#F59E0B,info:#22C55E,pointer:#D946EF"
        "--color=marker:#22C55E,fg+:#FFFFFF,prompt:#0EA5E9,hl+:#0EA5E9"
        # Optional: live file preview using bat if you want file contents shown on the side
        "--preview='bat --color=always --style=numbers --line-range=:500 {}'"
      ];
    };
  };
}
