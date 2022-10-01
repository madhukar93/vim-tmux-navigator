#!/usr/bin/env bash

bind -n 'C-h' if-shell -F "#{@is_vim}" "send-keys C-h"  "select-pane -L"
bind -n 'C-j' if-shell -F "#{@is_vim}" "send-keys C-j"  "select-pane -D"
bind -n 'C-k' if-shell -F "#{@is_vim}" "send-keys C-k"  "select-pane -U"
bind -n 'C-l' if-shell -F "#{@is_vim}" "send-keys C-l"  "select-pane -R"
bind -n 'C-\' if-shell -F "#{@is_vim}" "send-keys 'C-\\'" "select-pane -l"

#version_pat='s/^tmux[^0-9]*([.0-9]+).*/\1/p'
#tmux_version="$(tmux -V | sed -En "$version_pat")"
#tmux setenv -g tmux_version "$tmux_version"
tmux bind-key -T copy-mode-vi C-h select-pane -L
tmux bind-key -T copy-mode-vi C-j select-pane -D
tmux bind-key -T copy-mode-vi C-k select-pane -U
tmux bind-key -T copy-mode-vi C-l select-pane -R
tmux bind-key -T copy-mode-vi C-\\ select-pane -l
