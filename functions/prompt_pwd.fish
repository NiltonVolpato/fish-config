function prompt_pwd --description 'Prints the current working directory'
  set -l home ~
  echo $PWD | sed \
      -e "s|^$home|~|" \
      -e 's|/google/src/cloud/nilton/|@|' \
      -e 's|^/private/|/|'
end
