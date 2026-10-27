{ pkgs, ...}: {
 programs.zoxide = { 
   enable = true;
 
 # Whether to integrate into fish
 enableFishIntegration = true;
 };
}
