set -g __right_prompt_sep '❬'

function fish_right_prompt
  set_color $fish_color_autosuggestion[1]
	echo $__right_prompt_sep (prompt_pwd)
	set_color normal
end

function toggle_right_prompt_sep
  if [ $__right_prompt_sep = '❬' ]
	  set __right_prompt_sep '❭'
	else
	  set __right_prompt_sep '❬'
  end
	commandline -f repaint
end

bind \cx toggle_right_prompt_sep
