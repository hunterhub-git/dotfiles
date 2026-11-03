{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.terminalEnhancements == true) {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd" # Replaces standard 'cd' with smarter zoxide navigation
      ];
    };

    # Bind zoxide's interactive search (zi) to the Everforest Soft fzf palette
    home.sessionVariables._ZO_FZF_OPTS = lib.concatStringsSep "," [
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
    ];
  };
}
