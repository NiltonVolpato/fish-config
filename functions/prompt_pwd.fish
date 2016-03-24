function prompt_pwd --description 'Print the current working directory'
	set -l args_post
	set -l args_pre -e 's|^/private/|/|'
	set -l realhome ~
	echo $PWD | sed -e "s|^$realhome|~|" $args_pre $args_post
end