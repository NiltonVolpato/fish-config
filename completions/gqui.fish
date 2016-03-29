function __gqui_complete
  set -lx G_COMP_WORDBREAKS ' "'\''><=;|&(:'  # '
  set -lx COMP_LINE (commandline)
  set -lx COMP_POINT (commandline -C)
  for completion in (/usr/bin/cli-client-gqui COMPLETE)
    echo $completion | sed 's/ *$//g'
  end
end

complete -x -c gqui -a '(__gqui_complete)'
