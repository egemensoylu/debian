# Shell aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias cls='clear'
alias reload-bash='source ~/.bashrc'
alias edit-bashrc='${EDITOR:-vim} ~/.bashrc'
alias edit-aliases='${EDITOR:-vim} ~/.bash_aliases'

# Debian package naming helpers
alias fd='fdfind'

# Python / Django helpers
alias pmr='python manage.py runserver'
alias pmm='python manage.py makemigrations'
alias pmmigrate='python manage.py migrate'

# Navigation helpers
alias cdd='cd ~/Desktop'
alias cdp='cd ~/projects 2>/dev/null || cd ~/Projects 2>/dev/null || pwd'
