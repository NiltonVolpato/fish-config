# set -g __right_prompt_sep '<'
set -g __right_prompt_sep \uE0B3
set -g __citc_prefix /google/src/cloud/$USER

function fish_right_prompt
  set_color $fish_color_autosuggestion[1]
  echo -n $__right_prompt_sep' '

  set -l parts (\
      echo $PWD | \
      sed -e 's,'$__citc_prefix'/\([^/]*\)/\(.*\),\1\n\2,')
  if [ (count $parts) -eq 2 ]
    set -l client $parts[1]
    set -l path $parts[2]
    echo -n '@'$client
    if [ -n $path -a $path != google3 ]
      set -l path (echo $path | sed 's,^google3/,,')
      echo -n ' '$__right_prompt_sep //$path
    end
  else
    prompt_pwd
  end

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
