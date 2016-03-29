function _setup_bash_complete -S
  set -x COMP_WORDBREAKS ' "'\''><=;|&(:'  # '

  set -x COMP_LINE (commandline)
  set -x COMP_POINT (commandline --cursor)
  set -x COMP_TYPE 9

  # Note: bash arrays start at zero.
  set -x COMP_CWORD (count (commandline --tokenize --cut-at-cursor))
  set -x COMP_WORDS (commandline --tokenize)
  if [ (count $COMP_WORDS) -eq $COMP_CWORD ]
    set COMP_WORDS $COMP_WORDS ""
  end
end
