###################################################################
##       _        _  __      _    _                _             ##
##      / \   ___(_)/ _|    / \  | | _____  _ __  (_) ___  ___   ##
##     / _ \ / __| | |_    / _ \ | |/ / _ \| '_ \ | |/ _ \/ _ \  ##
##    / ___ \\__ \ |  _|  / ___ \|   < (_) | | | || |  __/  __/  ##
##   /_/   \_\___/_|_|   /_/   \_\_|\_\___/|_| |_|/ |\___|\___|  ##
##                                              |__/             ##
###################################################################
# This is my simple zshrc without oh-my-zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export EDITOR="micro"
export TERM="konsole"
export BROWSER="firefox"

##------------------- ENABLE COLORS -----------------------##

autoload -U colors && colors

##------------------- AUTOCOMPLETE -----------------------##

autoload -Uz promptinit
promptinit
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt autocd
cdpath=($HOME $HOME/.config)

##------------------- ZSH HISTORY -----------------------##

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

##------------------- ZSH PLUGINS -----------------------##

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/colored-man-pages.plugin.zsh
# History substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

##------------------- PROMPT -----------------------##

autoload -Uz vcs_info
precmd() { vcs_info }
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '%B   %b '

##-------------------- PROPMT THEME ----------------------##

source ~/.zsh/themes/asif@akonjee.zsh-theme
#source ~/.zsh/themes/asifakonjee.zsh-theme
#source ~/.zsh/themes/slash.zsh-theme

#If don't want to use themes then uncomment: But be sure what you are doing!

#PROMPT="%(?:%{$fg_bold[green]%}{ %{$fg_bold[white]%}%c \${vcs_info_msg_0_} %{$fg_bold[green]%}}"    #show the current directory only
#PROMPT="%(?:%{$fg_bold[green]%}{ %{$fg_bold[white]%}%~ %{$fg_bold[green]%}}"   #show the full path of directory
#PROMPT+=' %{$fg_bold[white]%}%{$fg_bold[white]%} :%{$fg_bold[red]%} )'
#RPROMPT="%{$fg[green]%}[%{$fg[green]%}%@ ]"
#RPROMPT="\$vcs_info_msg_0_ %{$fg[green]%}[%{$fg[green]%}%@ ]"


##------------------- ALIAS -----------------------##
alias add='sudo pacman -S'
alias remove='sudo pacman -R'
alias premove='paru -Rnss'
alias clean='sudo pacman -Rns'
alias upm='sudo pacman -Sy'
alias up='sudo pacman -Syyu'
alias search='pacman -Q'
alias cclean='sudo paccache -rk 1'
alias dclean='sudo pacman -Sc --noconfirm'
alias ls='eza -a --grid --icons --color=always' # my preferred listing
alias la='eza -al --grid --icons --color=always'  # all files and dirs
alias ll='eza -l --grid --icons --color=always'  # long format
alias gcl='git clone'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias ..='cd ..'
alias pd='pwd'
alias cat='bat --theme ansi'
alias fm='yazi'
alias zconf='micro .zshrc'
alias bconf='micro .bashrc'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias reboot='systemctl reboot'
alias poweroff='systemctl poweroff'
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias srb='source .bashrc'
alias srz='source .zshrc'
alias grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mirrorall='sudo curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/'
alias edit="sudoedit"
alias ctl="hyprctl"
alias lsi="lsix"
alias img="img2sixel -w 1248 -h 702"
alias fonts='sudo fc-cache -fv'
alias fetch='fastfetch'
alias yta="yt-dlp --extract-audio --audio-format mp3 "
alias ytv="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "



##------------------- ZSH HOME DECOR --------------------##

#nitch
#neofetch
