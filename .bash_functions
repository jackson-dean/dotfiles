#!/bin/bash

#Does a recursive search and replace from the current directory down.
#example: findreplace 'find' 'substitution' 'delimiter'
findreplace() {
  if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
      echo -e "\nFind and replace a string in all files within the current directory."
      echo "Example: findreplace 'findme' 'substitution'"
      return
  fi

  #make sure we've got enough args
  if [[ "$#" -lt 2 ]]; then
      echo "findreplace requires at least 2 arguments. A string to find and a substitution string."
      echo "You may also pass a 3rd 'delimiter' argument in order to override the default '/' delimiter"
      echo "Use -h or --help to see an example."
      return
  fi

  #in case we want to use a different delimiter
  if [[ -n "$3" ]]; then
      delimiter=$3
  else
      delimiter='/'
  fi

  #Sed recursive find and and replace from current directory
  find ./ -type f -exec sed -i -e "s${delimiter}${1}${delimiter}${2}${delimiter}g" {} \;
}

function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tbz2) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

__has_parent_dir () {
    test -d "$1" && return 0;
    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done
    return 1;
}

#functin to display repo and branchname
__vcs_name() {
    if [ -d .svn ]; then
        echo "- [svn]";
    elif __has_parent_dir ".git"; then
        branchName="$(__git_ps1 '%s')"

        #this is so we can have long descriptive branch names when using
        #listing them, but short ones at the prompt
        #basically, we just capture everything preceeding the double hyphen "--"
        [[ $branchName =~ (.*)-- ]] && branchName="${BASH_REMATCH[1]}"

        echo "($branchName)";
    elif __has_parent_dir ".hg"; then
        echo "- [hg $(hg branch)]"
    fi
}
