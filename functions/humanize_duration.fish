function humanize_duration
	if [ "$argv[1]" -lt 1000 ]
	  echo "$argv[1]"ms
		return
	end
	
	set -l d (expr "$argv[1]" / 1000)
	set -l result

  __format_duration 60 s s
  __format_duration 60 min min
  __format_duration 24 h h
  __format_duration 100000000000000 day days
	echo $result
end

function __format_duration -S -a factor -a singular -a plural
  set -l value (expr $d \% $factor)
	if [ "$value" -eq 1 ]
	  set result $value$singular $result
	else if [ "$value" -gt 1 ]
	  set result $value$plural $result
	end
	set d (expr $d / $factor)
end
