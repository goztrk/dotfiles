#!/usr/bin/env bash
#
# Dotfiles installer

# ==============================================================================
# Definitions {{{
# ==============================================================================

NC='\033[0m'
C_BLACK='\033[0;30m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_BROWN='\033[0;33m'
C_BLUE='\033[0;34m'

# Exit if there is an error
set -e

# Print empty
echo ''

step () {
  printf "\r${C_BROWN}--${NC} ${C_GREEN}STEP${NC} ${C_RED}$1${NC}: $2\n"
}

info () {
  printf "\r  [ ${C_BLUE}..${NC} ] $1\n"
}

user () {
  printf "\r  [ ${C_BROWN}??${NC} ] $1\n"
}

success () {
  printf "\r\033[2K  [ ${C_GREEN}OK${NC} ] $1\n"
}

fail () {
  printf "\r\033[2K  [${C_RED}FAIL${NC}] $1\n"
  echo ''
  exit
}

# ISSUDO=$(sudo -l &> /dev/null);

# }}}


printf "\r[     DOTFILES INSTALLER     ]\n"
echo ''


# ==============================================================================
# Install dotfiles {{{
# ==============================================================================

step '1' 'Cloning dotfiles'
if [ ! -d $HOME/.dotfiles ]
then
  info 'Cloning dotfiles...'
  git clone https://github.com/goztrk/dotfiles .dotfiles
else
  info '.dotfiles folder exists...'
  # TODO: Check if it is master branch. If master, use `git pull` command.
fi

DOTFILES_ROOT="$HOME/.dotfiles"

success 'Done!'

# }}}

echo ''

# ==============================================================================
# Run installers {{{
# ==============================================================================

step '2' 'Running installers'

find . -name installer.sh | while read installer ; do sh -c "${installer}" ; done

success 'Done!'

# }}}

echo ''

# ==============================================================================
# Symlink dotfiles {{{
# ==============================================================================

step '3' 'Symlink dotfiles'

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then
        skip=true;
      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

symlink_dotfiles () {
  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

symlink_dotfiles

success 'Done!'

# }}}
