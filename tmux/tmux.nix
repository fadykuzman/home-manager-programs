{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    clock24 = true;
    escapeTime = 0;
    terminal = "tmux-256color";
    keyMode = "vi";
    prefix = "C-s";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          ${builtins.readFile ./catppuccin.tmux}
        '';
      }
      vim-tmux-navigator
      #extraConfig = ''
      #  ${builtins.readFile ./tmux-vim-navigator.conf}
      #'';
    ];
    extraConfig = ''
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf
      set-option -g status-position top
      # Add these lines for better color support
      set-option -sa terminal-features ',xterm-256color:RGB'
    '';
    tmuxinator.enable = true;
  };
}
