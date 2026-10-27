{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    
    enableFishIntegration = true;

    settings = {
      add_newline = true;
      scan_timeout = 10;
      character = {
        success_symbol = ">";
        error_symbol = "#ERROR#";
      };
    };
  };
}
