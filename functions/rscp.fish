function rscp
  rsync -avPI -e ssh $argv
end
