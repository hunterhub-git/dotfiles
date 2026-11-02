{ config, lib, pkgs, myUserControlPanel, mySystemControlPanel, ... }: {

  mySystemControlPanel = {

# Control panel options

  # System control options
  #--------------------------------#
    # Default shell 
      defaultShell = "fish";
  #--------------------------------#
    # Default system audio processing service
      systemAudio = "pipewire";
  #--------------------------------#
    # Enable media services?
      mediaServices = true;
  #--------------------------------#
  };
}
