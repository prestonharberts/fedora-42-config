# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

export PATH=/home/prestonharberts/Bin/:$PATH
export PATH=/home/prestonharberts/go/bin/:$PATH
export PATH=/home/prestonharberts/Bin/flutter/bin/:$PATH

unset rc

PATH="/home/prestonharberts/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/prestonharberts/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/prestonharberts/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/prestonharberts/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/prestonharberts/perl5"
export PERL_MM_OPT

# aliases
alias q='exit'

# frequently used commands: software
alias b='bib'
alias c='codium'
alias d='detox -s hyphenated'
alias g='gio open'
alias p='xclip -sel c'
alias z='zathura --fork'

alias n='nvim'
alias v='nvim'
alias vi='nvim'

# frequently used commands: navigation
alias cls='clear && ls'
alias cdu='cd ..'
alias cduu='cd ../..'
alias cduuu='cd ../../..'

# frequently used commands: system
alias upgrade='sudo dnf upgrade --exclude=kernel* --refresh -y && sudo dnf autoremove -y && flatpak upgrade -y'
alias upgrade-kernel='sudo dnf upgrade --refresh'
alias fetch='neofetch --off'

# frequently used commands: files and folders
alias csc='cd ~/Documents/school/classes/csc/'
alias obsidian='cd ~/Documents/obsidian/'
alias .obsidian='cd ~/Documents/obsidian/.obsidian/'
alias snippets='cd ~/Documents/obsidian/.obsidian/snippets/'
alias fedora='cd ~/Repos/fedora-41-configuration/'
alias bg2ob='cd ~/Repos/biblegateway-to-obsidian/'
alias pwa='cd /home/prestonharberts/.local/share/firefoxpwa/profiles/00000000000000000000000000'

# frequently used commands: git
alias gits='git status'
alias gitcm='git commit -m'
alias gita='git add'
alias gitrm='git rm'
alias gitaa='git add -A'
alias gitpl='git pull'
alias gitps='git push'

# frequently used commands: vm
alias vv='LD_PRELOAD=/path/to/hide-menubar.so virt-viewer'
alias f41='sudo virsh start fedora41 && sudo LD_PRELOAD=~/src/hide-menubar/hide-menubar.so virt-viewer fedora41'
alias vf41='sudo LD_PRELOAD=~/src/hide-menubar/hide-menubar.so virt-viewer fedora41'
alias sf41='sudo virsh shutdown fedora41'

alias gcloud-pub='ssh -i ~/.ssh/shared-key shared-access-key@34.59.33.66'
alias gcloud-dev='ssh -i ~/.ssh/shared-key-dev shared-access-key@34.57.18.232'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/prestonharberts/.bin/google-cloud-sdk/path.bash.inc' ]; then . '/home/prestonharberts/.bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/prestonharberts/.bin/google-cloud-sdk/completion.bash.inc' ]; then . '/home/prestonharberts/.bin/google-cloud-sdk/completion.bash.inc'; fi

PS1='\[\e]0;\W\a\][\[\033[01;34m\]\h \W\[\033[00m\]] $ '

# disable Ctrl+S and Ctrl+Q
stty -ixon
stty intr ^d
stty eof ^w
