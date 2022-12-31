#!/usr/bin/env bash

#if-shell '[ -f /.dockerenv ]' \
  #"is_vim=\"ps -o state=,comm= -t '#{pane_tty}' \
      #| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'\""
  ## Filter out docker instances of nvim from the host system to prevent
  ## host from thinking nvim is running in a pseudoterminal when its not.
  #"is_vim=\"ps -o state=,comm=,cgroup= -t '#{pane_tty}' \
      #| grep -ivE '^.+ +.+ +.+\\/docker\\/.+$' \
      #| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)? +'\""

# vim is setting thsese options from its side of the integration
tmux bind -n 'C-h' if-shell -F "#{@is_vim}" "send-keys C-h"  "select-pane -L"
tmux bind -n 'C-j' if-shell -F "#{@is_vim}" "send-keys C-j"  "select-pane -D"
tmux bind -n 'C-k' if-shell -F "#{@is_vim}" "send-keys C-k"  "select-pane -U"
tmux bind -n 'C-l' if-shell -F "#{@is_vim}" "send-keys C-l"  "select-pane -R"
tmux bind -n 'C-\' if-shell -F "#{@is_vim}" "send-keys 'C-\\'" "select-pane -l"

tmux bind-key -T copy-mode-vi C-h select-pane -L
tmux bind-key -T copy-mode-vi C-j select-pane -D
tmux bind-key -T copy-mode-vi C-k select-pane -U
tmux bind-key -T copy-mode-vi C-l select-pane -R
tmux bind-key -T copy-mode-vi C-\\ select-pane -l
