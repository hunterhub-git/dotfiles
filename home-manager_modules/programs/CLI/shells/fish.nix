{ pkgs, ... }: {
  programs.fish = {
    enable = true;

# 1. Shell Abbreviations
  shellAbbrs = {

# Miscellaneous
r = "sudo nixos-rebuild switch --flake";
h = "home-manager switch --flake .";
      
# Git
g = "git";
gch = "git checkout";
gi = "git init";
gcl = "git clone";
gco = "git commit";
gf = "git fetch";

# Common Shortcuts
ll = "ls -l";
la = "ls -a";
lla = "ls -l -a";
v = "vim";
ela = "eza -la";
et = "eza --tree";
b = "bat";
bp = "bat --plain";
fde = "fd -e";
fdh = "fd -H";
fdtd = "fd -t d";
fdtf = "fd -t f";

# Directory Navigation
"...." = "cd ../../..";
"..." = "cd ../..";
".." = "cd ..";
};

# 2. Shell Aliases
  shellAliases = {

ls = "ls --color";
};

# 3. Shell Initiate
  interactiveShellInit = ''
    fastfetch
    '';
  };
}
