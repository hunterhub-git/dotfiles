{ pkgs, ... }: {
  programs.fzf = {
    enable = true; 

# Fish Integration
enableFishIntegration = true;
    
# Default Options
defaultOptions = 
[
  "--height 40%"
  "--border"
];
  };
}
