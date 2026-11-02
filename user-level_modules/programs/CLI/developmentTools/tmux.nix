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

        # --- Penguins of Madagascar Arctic Palette Theme ---
        set -g status-style "bg=#0B0F15,fg=#ECF4FF"
        
        # Left status: Operation banner in Skipper Gold & Ice Blue
        set -g status-left-length 40
        set -g status-left "#{?client_prefix,#[bg=#F59E0B fg=#0B0F15 bold],#[bg=#0EA5E9 fg=#0B0F15 bold]} 🐧 OP:#S "

        # Right status: System telemetry and clock
        set -g status-right-length 60
        set -g status-right "#[bg=#1E293B,fg=#0EA5E9] %Y-%m-%d #[bg=#0B0F15,fg=#ECF4FF]|#[bg=#1E293B,fg=#F59E0B] %H:%M "

        # Window status tabs
        set-window-option -g window-status-current-style "bg=#22C55E,fg=#0B0F15,bold"
        set-window-option -g window-status-current-format " #I:#W* "
        
        set-window-option -g window-status-style "bg=#0B0F15,fg=#475569"
        set-window-option -g window-status-format " #I:#W "

        # Pane borders
        set -g pane-border-style "fg=#1E293B"
        set -g pane-active-border-style "fg=#0EA5E9"
      '';
    };

    # FZF tmux integration matching your control panel
    programs.fzf.tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [ "-d 40%" ];
    };
  };
}
