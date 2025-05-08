# .bashrc

# set shell prompt
PS1='\[\e]0;\W\a\][\[\033[01;34m\]\h \W\[\033[00m\]] $ '

# disable ctrl+S and ctrl+Q, and customize interrupt/eof keys
stty -ixon
stty intr ^d
stty eof ^w

# quick exit
alias q='exit'

# frequently used commands: file operations
# list all files in long format with human-readable sizes
alias ll='ls -alh --group-directories-first'
alias lt1='tree -L 1 -C'
alias lt2='tree -L 2 -C'
alias lt3='tree -L 3 -C'
alias b='bib'
alias d='detox -s hyphenated'
alias g='gio open'
alias x='xclip -sel c'
alias v='nvim'
alias vi='nvim'

# frequently used commands: development
alias killnode='pkill npm; pkill -f "npm start"; pkill -f node'
alias mdb='sudo systemctl start mariadb'

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
alias gits='git status'
alias gita='git add'
alias gitaa='git add -A'
alias gitcm='git commit -m'
alias gitpl='git pull'
alias gitps='git push'
alias gitrm='git rm'
alias gitr='git restore'
alias gitst='git stash'
alias gitstp='git stash pop'

# less frequently used commands: git
alias gitbd='git branch -d'
alias gitcb='git checkout -b'
alias gitpsbranch='git push --set-upstream origin'
alias gitpsdelbranch='git push --delete origin'

gitsetupall() {
  set -e

  # ensure we're in a git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Not a git repository."
    return 1
  fi

  # save the current branch
  originalBranch=$(git symbolic-ref --short HEAD 2>/dev/null)

  # stash changes with a label, including untracked files
  git stash push --include-untracked -m "Auto-stash before full git setup"

  # fetch all remotes
  git fetch --all

  # create missing local tracking branches
  for remoteBranch in $(git branch -r | grep -v "HEAD"); do
    localBranch=${remoteBranch#origin/}
    git show-ref --verify --quiet refs/heads/"$localBranch" ||
      git checkout -b "$localBranch" "$remoteBranch"
  done

  # pull latest changes into all local branches
  for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
    git checkout "$branch" && git pull --ff-only
  done

  # return to original branch if different
  currentBranch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$originalBranch" ] && [ "$originalBranch" != "$currentBranch" ]; then
    git checkout "$originalBranch"
  fi

  # restore stashed changes
  git stash pop || echo "Merge conflicts occurred when popping stash."
}

# frequently used commands: software
alias c='code --password-store=basic'

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

# frequently used commands: dirs and development
alias bh='cd ~/Repos/bridginghope-foodpantry && gitsetupall && 

export BROWSER="google-chrome --password-store=basic"
