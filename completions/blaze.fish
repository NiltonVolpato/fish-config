function __blaze_complete
  _setup_bash_complete

  bash -ic "\
source /etc/bash_completion.d/blaze; \
COMP_WORDS=($COMP_WORDS); \
_blaze::complete_wrapper; \
for comp in \"\${COMPREPLY[@]}\"; do echo \$comp; done"
end

complete -f -x -c blaze -a '(__blaze_complete)'
