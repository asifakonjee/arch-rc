###################################################################
##       _        _  __      _    _                _             ##
##      / \   ___(_)/ _|    / \  | | _____  _ __  (_) ___  ___   ##
##     / _ \ / __| | |_    / _ \ | |/ / _ \| '_ \ | |/ _ \/ _ \  ##
##    / ___ \\__ \ |  _|  / ___ \|   < (_) | | | || |  __/  __/  ##
##   /_/   \_\___/_|_|   /_/   \_\_|\_\___/|_| |_|/ |\___|\___|  ##
##                                              |__/             ##
###################################################################
# This is my bashrc file.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#export MOZ_ENABLE_WAYLAND=1
export EDITOR="nvim"
export CDPATH=.:$HOME:$HOME/.config/
export TERM="foot"

########
#ALCI
########
#alias evb='sudo systemctl enable --now vboxservice.service'

##--------------------------------------------- PROMPT -------------------------------------------##

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

#PS1="\[\e[01;39m\]{ \[\e[01;32m\]\w \[\e[01;39m\]} \[\e[01;32m\]\[\$ \]\[\e[01;39m\] \[\e[1;37m\]"
PS1="\[\e[1;35m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\]\n\[\e[01;39m\]{ \[\e[01;32m\]\w \[\e[01;39m\]} \[\e[01;39m\] \[\e[1;37m\]"
#PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\[\033[00m\]\n\w\[\e[1;31m\] \[\e[1;36m\]\[\e[1;37m\] "
#PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\n\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;36m\]\[\e[1;37m\] "

##------------------- ALIAS -----------------------##
alias add='sudo pacman -S'
alias remove='sudo pacman -R'
alias premove='paru -Rnss'
alias clean='sudo pacman -Rns'
alias upm='sudo pacman -Sy'
alias up='sudo pacman -Syyu'
alias search='pacman -Ss'
alias list='pacman -Qq'
alias cclean='sudo paccache -rk 1'
alias ls='exa -a -G --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -al -G --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l -G --icons --color=always --group-directories-first'  # long format
alias ..='cd ..'
alias pd='pwd'
alias gcl='git clone'
alias ga='git add -u'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias cat='bat --theme ansi'
alias rf='ranger'
alias bconf='micro .bashrc'
alias zconf='micro .zshrc'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias srb='source .bashrc'
alias srz='source .zshrc'
alias grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias vim="nvim"
alias edit="sudoedit"
alias brc="source .bashrc"
alias ctl="hyprctl"
alias lsi="lsix"
alias img="img2sixel -w 1248 -h 702"


##------------------- BASH HOME DECOR --------------------##

nitch
#figlet Hyprland
#neofetch
