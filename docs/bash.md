# Bash

Move `bash/.bashrc` and `bash/.bash_profile` to your home directory. Change all the necessary PATH variables in `.bash_profile` to have the correct username.

Move `bash/.inputrc` to your home directory, and run the following in a terminal:

```
bind -f ~/.inputrc
```

Move all of the files in `fedora-40-configuration/configs/bash/bin/` to `~/Bin/` if you would like to use several helpful scripts. Otherwise, skip or add `fedora-40-configuration/configs/bash/bin/` to your PATH in `.bash_profile`.

## Turn Off Bash Case Sensitivity

Skip this step if you are using my `.inputrc`: run the following in Terminal to turn off case sensitivity in Bash, and restart the shell:

```
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
```

Source: https://askubuntu.com/questions/87061/can-i-make-tab-auto-completion-case-insensitive-in-bash

## Show password asterisks in terminal

This section will show asterisks when typing out passwords in the terminal. Run the following command to open the visudo config:

```
sudo visudo
```

Then, place the second line of the follow code directly after the first line as follows to show asterisks when typing passwords:

```
Defaults    env_reset
Defaults    pwfeedback
```

Add this to the end of the file to enable running these commands without sudo:

```
prestonharberts ALL=(ALL) NOPASSWD: /usr/bin/dnf
# currently, I don't use this full line. it's for my old keyd configuration
#prestonharberts ALL=(ALL) NOPASSWD: /usr/bin/dnf, /usr/local/bin/keyd
```

## Forward search

Run the following to enable forward searching with `Ctrl+S`:

```
stty -ixon
```
