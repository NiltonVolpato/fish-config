set -g __prompt_style alternate

function fish_prompt --description 'Write out the prompt'
  switch $__prompt_style
    case default
      switch $USER
        case root toor
          set_color $fish_color_cwd_root
        case '*'
          set_color $fish_color_cwd
      end
      echo -n -s "$USER" ' '
      echo -n -s (set_color blue) (prompt_pwd) ' '
      echo -n -s (set_color --bold blue) '$ ' (set_color normal)
    case alternate
      echo -n -s (set_color --bold blue) '$ ' (set_color normal)
  end
end

function fish_right_prompt
  switch $__prompt_style
    case default
    case alternate
      set_color $fish_color_autosuggestion[1]
      echo -n $__right_prompt_sep' '
      prompt_pwd
      set_color normal
  end
end

function toggle_prompt_style
  switch $__prompt_style
    case default
      set __prompt_style alternate
    case alternate
      set __prompt_style default
  end
  commandline -f repaint
end
bind \cx toggle_prompt_style

function maybe_execute
  set -l CMDLINE (commandline)
  if [ -n "$CMDLINE" ]
    commandline -f execute
  end
end
# bind \n maybe_execute

function command_summary --on-event fish_postexec
  # Save the last status for later, otherwise any command will override it.
  set -l last_status $status

  [ -z "$argv" ]; and return  # Do not output anything if there was no command.

  if [ $last_status -ne 0 ]
    set_color $fish_color_error[1]
    echo Exit status: $last_status
  end

  if [ "$CMD_DURATION" -ge 100 ]
    set_color $fish_color_autosuggestion[1]
    echo Time elapsed: (humanize_duration $CMD_DURATION)
  end

  set_color normal
end
