#!/bin/bash

BASHRC=$HOME/.bashrc
SOURCE_SYNTHSHELL='if [ -f ~/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then\n	source ~/.config/synth-shell/synth-shell-prompt.sh\nfi'

bash ~/.dotfiles/install.sh
bash ~/.dotfiles/symlink-dotfiles.sh

echo -e "\n## opens fzf when ctrl+f key was press and creates a tmux session based on the selected basename" >> $BASHRC
echo "#-----------------------------------------------------" >> $BASHRC
cat <<'EOF' >> ~/.bashrc
bind -x '"\C-f": tmux-sessionizer'
EOF

echo -e '\n' >> $BASHRC
echo "## synth-shell-prompt.sh" >> $BASHRC
echo "##-----------------------------------------------------" >> $BASHRC
echo -e $SOURCE_SYNTHSHELL >> $BASHRC

source ~/.bashrc
