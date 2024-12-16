#!/usr/bin/env zsh

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# Install yadm and clone dotfiles.
brew install yadm
yadm clone git@github.com:AshleighWilson/dotfiles.git
yadm gitconfig --unset status.showUntrackedFiles
yadm submodule update --recursive --init
