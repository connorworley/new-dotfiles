function fish_prompt
    if test $TERM = 'dumb'
	echo '$ '
    else
	echo -n (date "+[%H:%M:%S]")
	echo -n ' '
	if [ "$SSH_TTY" ]
	    set_color --bold brgreen
	    echo -n (whoami)
	    set_color normal
	    echo -n '@'
	    set_color --bold red
	    echo -n (hostname)
	end
# TODO: show a git prompt here
	set_color --bold green
	echo -n (string replace "$HOME" '~' (pwd))
	echo -n ' '
	set_color normal
    end
end
