{ config, lib, pkgs, ... }: {
  imports = [
    ./user-level_modules/core/user-control.nix
];

  myUserControlPanel = {

# User control options

  #--------------------------------#
# Command line interface options
  #--------------------------------#
  # Default Terminal to use
    defaultTerminal = "foot";
  #--------------------------------#
  # Default Editor to use
    defaultEditor = "neovim";
  #--------------------------------#
  # Enable terminal rice?
    terminalEnhancements = true;
  #--------------------------------#
  # Enable default shell tools?
    terminalTools = true;
  #--------------------------------#
  # Enable development tools?    
    developmentTools = true;
  #--------------------------------#
  # Enable cybersecurity tools?

  #--------------------------------#
# Browser options
  };
}
