{ config, lib, pkgs, ... }: {

  config = lib.mkIf (config.myUserControlPanel.studentMode == true) {
  
  programs.obsidian = {
    enable = true;
    defaultSettings = {
      corePlugins = [
        "backlink"
        "bookmarks"
        "canvas"
        "file-explorer"
        "footnotes"
        "random-note"
        "publish"
        "properties"
        "global-search"
        "bases"
        ];
      };
    };

  };

}
