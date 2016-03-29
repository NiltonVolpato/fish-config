function __g4_complete
  _setup_bash_complete
  g4 tabcomplete --token=$COMP_CWORD --type=63 $COMP_WORDS ^ /dev/null | \
      sed 's/ \+/\t/'
end

complete -x -c g4 -a '(__g4_complete)'
