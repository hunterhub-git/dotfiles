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
        # Set Leader key to comma (,) to match your Neovim workflow
        unbind C-b
        set-option -g prefix ,
        bind-key , send-prefix

        # Enable mouse support
        set -g mouse on

        # True color support
        set-option -sa terminal-overrides ",foot*:Tc"

        # Color theme
        set -g status-style "bg=#121212,fg=#d0d0d0"

        # Left status
        set -g status-left-length 40
        set -g status-left "#{?client_prefix,[bg=#ff4444 fg=#121212 bold],[bg=#00ccff fg=#121212 bold]} 🖥️ SYS "

        # Right status
        set -g status-right-length 60
        set -g status-right "#[bg=#1f1f1f,fg=#00ff66] %Y-%m-%d #[bg=#121212,fg=#d0d0d0]|[bg=#1f1f1f,fg=#ff4444] %H:%M "

        # Window status tabs
        set-window-option -g window-status-current-style "bg=#00ff66,fg=#121212,bold"
        set-window-option -g window-status-current-format " #I:#W "

        set-window-option -g window-status-style "bg=#121212,fg=#888888"
        set-window-option -g window-status-format " #I:#W "

        # Pane borders
        set -g pane-border-style "fg=#333333"
        set -g pane-active-border-style "fg=#00ccff"
      '';
    };

    programs.fzf.tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-d 40%" ];
    };
  };
}
