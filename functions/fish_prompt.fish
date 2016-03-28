#set -g __prompt_sep '>'
set -g __prompt_sep \uE0B1

function fish_prompt --description 'Write out the prompt'
  set -l suffix
  switch $USER
    case root toor
      set_color $fish_color_cwd_root
    case '*'
      set_color $fish_color_cwd
  end

  echo -n -s "$USER" ' ' (set_color normal) "$__prompt_sep "
end

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

  [ -z "$argv" ]; and return
  [ "$CMD_DURATION" -lt 100 ]; and return

  set_color $fish_color_autosuggestion[1]
  echo -n Elapsed: (humanize_duration $CMD_DURATION)
  set_color normal
  echo
end
