#!/usr/bin/env bash

# An array with the alias instances to enable
__enable_alias=(
  curl
  docker
  general
  git
  homebrew
  maven
)

# An array with the completion instances to enable
__enable_completion=(
  awscli
  bash-it
  brew
  maven
  ssh
  system
  terraform
)

# An array with the plugin instances to enable
__enable_plugin=(
  alias-completion
  aws
  base
  battery
  dirs
  docker
  git
  java
  python
  ssh
)

# Find out where Bash-it is located, with a reasonable fallback
__BASH_IT_INSTALL=${BASH_IT:-$HOME/.bash_it}

if [ ! -f "$__BASH_IT_INSTALL/bash_it.sh" ] ; then
  echo "Bash-it not found at $__BASH_IT_INSTALL."
  # shellcheck disable=SC2016
  echo 'Please set the $BASH_IT variable to point to your Bash-it installation.'
  exit 1
else
  echo "Bash-it location  : $__BASH_IT_INSTALL"
fi

# shellcheck disable=SC1090
source "$__BASH_IT_INSTALL/bash_it.sh"

echo ''

# Disable all alias instances
echo 'Disable all alias instances:'
bash-it disable alias all

# Enable all alias instances in one call
echo 'Enable alias instances:'
bash-it enable alias "${__enable_alias[@]}"
echo ''

# Disable all completion instances
echo 'Disable all completion instances:'
bash-it disable completion all

# Enable all completion instances in one call
echo 'Enable completion instances:'
bash-it enable completion "${__enable_completion[@]}"
echo ''

# Disable all plugin instances
echo 'Disable all plugin instances:'
bash-it disable plugin all

# Enable all plugin instances in one call
echo 'Enable plugin instances:'
bash-it enable plugin "${__enable_plugin[@]}"
echo ''
