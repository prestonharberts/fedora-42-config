# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# add custom bin directories to PATH
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH="/home/prestonharberts/Bin:$PATH"
PATH="/home/prestonharberts/Bin/flutter/bin:$PATH"
PATH="/home/prestonharberts/go/bin:$PATH"
PATH="/home/prestonharberts/perl5/bin${PATH:+:$PATH}"
# prioritize executables in the current directory
export PATH=.:$PATH

# set perl environment variables
PERL5LIB="/home/prestonharberts/perl5/lib/perl5${PERL5LIB:+:$PERL5LIB}"
PERL_LOCAL_LIB_ROOT="/home/prestonharberts/perl5${PERL_LOCAL_LIB_ROOT:+:$PERL_LOCAL_LIB_ROOT}"
PERL_MB_OPT="--install_base \"/home/prestonharberts/perl5\""
PERL_MM_OPT="INSTALL_BASE=/home/prestonharberts/perl5"
export PERL5LIB
export PERL_LOCAL_LIB_ROOT
export PERL_MB_OPT
export PERL_MM_OPT

# load additional shell configs from ~/.bashrc.d if the directory exists
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    [ -f "$rc" ] && . "$rc"
  done
fi

# enable gcloud SDK and shell completion if installed
if [ -f "$HOME/.bin/google-cloud-sdk/path.bash.inc" ]; then
  . "$HOME/.bin/google-cloud-sdk/path.bash.inc"
fi
if [ -f "$HOME/.bin/google-cloud-sdk/completion.bash.inc" ]; then
  . "$HOME/.bin/google-cloud-sdk/completion.bash.inc"
fi

# set shell prompt
PS1='\[\e]0;\W\a\][\[\033[01;34m\]\h \W\[\033[00m\]] $ '

# disable ctrl+S and ctrl+Q, and customize interrupt/eof keys
stty -ixon
stty intr ^d
stty eof ^w

# quick exit
alias q='exit'

# frequently used commands: file operations
alias b='bib'
alias d='detox -s hyphenated'
alias g='gio open'
alias x='xclip -sel c'
alias v='nvim'
alias vi='nvim'

# frequently used commands: folder navigation
alias .obsidian='cd ~/Documents/obsidian/.obsidian/'
alias bg2ob='cd ~/Repos/biblegateway-to-obsidian/'
alias csc='cd ~/Documents/school/classes/csc/'
alias fedora='cd ~/Repos/fedora-41-config/'
alias obsidian='cd ~/Documents/obsidian/'
alias pwa='cd ~/.local/share/firefoxpwa/profiles/00000000000000000000000000/'
alias snippets='cd ~/Documents/obsidian/.obsidian/snippets/'

# frequently used commands: directory traversal
alias cls='clear && ls'
alias cdu='cd ..'
alias cduu='cd ../..'
alias cduuu='cd ../../..'

# frequently used commands: git
alias gitaa='git add -A'
alias gita='git add'
alias gitcm='git commit -m'
alias gitrm='git rm'
alias gitpl='git pull'
alias gitps='git push'
alias gits='git status'

# frequently used commands: software
alias c='code'

# frequently used commands: system upgrade
alias upgrade='sudo dnf upgrade --exclude=kernel* --refresh -y && sudo dnf autoremove -y && flatpak upgrade -y'
alias upgrade-kernel='sudo dnf upgrade --refresh'

# frequently used commands: virtual machines
alias f41='sudo virsh start fedora41 && sudo LD_PRELOAD=~/src/hide-menubar/hide-menubar.so virt-viewer fedora41'
alias sf41='sudo virsh shutdown fedora41'
alias vf41='sudo LD_PRELOAD=~/src/hide-menubar/hide-menubar.so virt-viewer fedora41'
alias vv='LD_PRELOAD=/path/to/hide-menubar.so virt-viewer'

# ssh connections
alias gcloud-dev='ssh -i ~/.ssh/shared-key-dev shared-access-key@34.57.18.232'
alias gcloud-pub='ssh -i ~/.ssh/shared-key shared-access-key@34.59.33.66'

# custom functions
# pipe to clipboard with |p
p() {
  xclip -selection clipboard
}
