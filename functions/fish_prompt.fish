function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

	#if [ -n "$LAST_CMDLINE" ]
	  set_color $fish_color_autosuggestion[1]
		echo "❭❭❭ $last_status ‖ elapsed "(humanize_duration $CMD_DURATION)" ❬❬❬"
		set_color normal
	#end

	set -l color_cwd
	set -l suffix
	switch $USER
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
			set suffix '#'
		case '*'
			set color_cwd $fish_color_cwd
			set suffix '❯'
	end

	echo -n -s (set_color $color_cwd) "$USER" ' ' (set_color normal) "$suffix "
end

function maybe_execute
  set -l CMDLINE (commandline)
	if [ -n "$CMDLINE" ]
	  commandline -f execute
	end
end
# bind \n maybe_execute
