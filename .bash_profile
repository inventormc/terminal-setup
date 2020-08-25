# Colorise ls
alias ls='ls -G'

# Shell prompt based on the Solarized Dark theme.
# Screenshot: http://i.imgur.com/EkEtphC.png
# Heavily inspired by @necolas’s prompt: https://github.com/necolas/dotfiles
# iTerm → Profiles → Text → use 13pt Monaco with 1.1 vertical spacing.

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

#if tput setaf 1 &> /dev/null; then
#	tput sgr0; # reset colors
#	bold=$(tput bold);
#	reset=$(tput sgr0);
#	# Solarized colors, taken from http://git.io/solarized-colors.
#	black=$(tput setaf 0);
#	blue=$(tput setaf 33);
#	cyan=$(tput setaf 37);
#	green=$(tput setaf 64);
#	orange=$(tput setaf 166);
#	purple=$(tput setaf 125);
#	red=$(tput setaf 124);
#	violet=$(tput setaf 61);
#	white=$(tput setaf 15);
#	yellow=$(tput setaf 136);
#else
bold='';
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";
#fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${blue}";
else
	userStyle="${blue}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${cyan}";
else
	hostStyle="${cyan}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Pylint
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin/pylint:${PATH}"
export PATH

case $- in
	   *i*) source ~/.bashrc
esac

# added by Anaconda3 4.4.0 installer
# export PATH="/Users/michaelchau/anaconda3/bin:$PATH"

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
	PYTHONHOME=$VIRTUAL_ENV /usr/bin/python "$@"
    else
	/usr/bin/python "$@"
    fi
}

# added by Anaconda3 4.4.0 installer
# export PATH="/Users/michaelchau/anaconda3/bin:$PATH"  # commented out by conda initialize

source ~/.git-completion.bash

export PATH=${PATH}:/usr/local/mysql/bin

export PATH=${PATH}:/Users/michaelchau/anaconda3/lib/python3.6/site-packages/flake8

export PYTHONPATH=/Users/michaelchau/Desktop/Reed-Website/MaterialsSite/predict/
export PATH=~/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/michaelchau/git/uizard/quickdraw-data/y/google-cloud-sdk/path.bash.inc' ]; then . '/Users/michaelchau/git/uizard/quickdraw-data/y/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/michaelchau/git/uizard/quickdraw-data/y/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/michaelchau/git/uizard/quickdraw-data/y/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/michaelchau/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/michaelchau/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/michaelchau/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/michaelchau/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

