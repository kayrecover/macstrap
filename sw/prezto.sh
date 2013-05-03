#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# Install Prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cat >> "${ZDOTDIR:-$HOME}/.zshrc" << EOF
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source "`brew --prefix`/etc/grc.bashrc"
chruby ruby-1.9
alias rm='nocorrect rm'
alias cp='nocorrect cp'
alias mv='nocorrect mv'
alias ss='nocorrect subl -n .'
alias subl='subl -n'
alias ds='du -sck * | sort -n'
alias d='cd ~/Downloads'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m "$@"'
alias ga='git add'
alias s='screen -r || screen'
alias youtube-dl='youtube-dl -t'
alias rq='rsync -vrP'
alias get='lftp -e "mirror --no-empty-dirs --Remove-source-files --use-pget-n=10 dl/complete ." fish://user@host'
alias s3cmd='nocorrect s3cmd'
alias dr='cd ~/Dropbox'

export EDITOR="vim"
export VISUAL="vim"
EOF
