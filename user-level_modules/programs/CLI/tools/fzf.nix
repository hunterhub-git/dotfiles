{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;

      # Force Everforest Soft palette and clean modern layout across all fzf / zi calls
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--color=bg:#323d43"
        "--color=bg+:#4b565c"
        "--color=spinner:#dbbc7f"
        "--color=hl:#7fbbb3"
        "--color=fg:#d3c6aa"
        "--color=header:#7a8478"
        "--color=info:#7fbbb3"
        "--color=pointer:#dbbc7f"
        "--color=marker:#a7c080"
        "--color=prompt:#a7c080"
        "--color=hl+:#83c092"
        "--color=fg+:#d3c6aa"
        "--color=border:#4b565c"
      ];
    };
  };
}
