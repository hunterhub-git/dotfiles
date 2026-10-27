{ pkgs, ... }: {
  programs.fd = {
    enable = true;
# Search hidden directories
    hidden = true;
  };
} 
