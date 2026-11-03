{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.developmentTools == true) {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      clock24 = true;
      terminal = "screen-256color";
      baseIndex = 1;
      escapeTime = 0;
      historyLimit = 10000;

      extraConfig = ''
        # Set Leader key to comma (,)
        unbind C-b
        set-option -g prefix ,
        bind-key , send-prefix

        # Enable mouse support
        set -g mouse on

        # True color support
        set-option -sa terminal-overrides ",foot*:Tc"

        # --- Everforest Soft Palette Theme ---
        set -g status-style "bg=#272E33,fg=#D3C6AA"

        # Left status: Operation banner
        set -g status-left-length 40
        set -g status-left "#{?client_prefix,#[bg=#E67E80,fg=#272E33,bold],#[bg=#7FBBB3,fg=#272E33,bold]} 🌲 SYS "

        # Right status: System telemetry and clock with valid comma-separated attributes
        set -g status-right-length 60
        set -g status-right "#[bg=#30383C,fg=#A7C080] %Y-%m-%d #[bg=#272E33,fg=#D3C6AA]│#[bg=#30383C,fg=#E67E80] %H:%M "

        # Window status tabs
        set-window-option -g window-status-current-style "bg=#A7C080,fg=#272E33,bold"
        set-window-option -g window-status-current-format " #I:#W "

        set-window-option -g window-status-style "bg=#272E33,fg=#7A8478"
        set-window-option -g window-status-format " #I:#W "

        # Pane borders
        set -g pane-border-style "fg=#30383C"
        set -g pane-active-border-style "fg=#7FBBB3"

        # Bind prefix + r to split a bottom pane (30% height) for running code
        bind-key r split-window -v -p 30 "fish"
      '';
    };

    programs.fzf.tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-d 40%" ];
    };
  };
}
