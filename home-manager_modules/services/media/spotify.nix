{ pkgs, ... }: {
  programs.spotify-player = {
    enable = true;
  };
  services.spotifyd = {
    enable = true;
  };
}  
