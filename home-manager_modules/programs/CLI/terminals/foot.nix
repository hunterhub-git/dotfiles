{ pkgs, ... }: {
  programs.foot = {
    enable = true;

  settings = {
    main = {
      dpi-aware = "yes";
      term = "foot";
    };

    mouse = {
      hide-when-typing = "yes";
    };

    };
  };
}
