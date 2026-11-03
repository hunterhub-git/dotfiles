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
        "--color=bg+:#30383C"
        "--color=bg:#272E33"
        "--color=spinner:#D699B6"
        "--color=hl:#7FBBB3"
        "--color=fg:#D3C6AA"
        "--color=header:#7A8478"
        "--color=info:#7FBBB3"
        "--color=pointer:#E67E80"
        "--color=marker:#DBBC7F"
        "--color=prompt:#A7C080"
        "--color=hl+:#83C092"
        "--color=fg+:#FDF6E3"
        "--color=border:#30383C"
      ];
    };
  };
}
