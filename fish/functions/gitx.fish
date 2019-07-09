function gitx
	if count $argv > 0
		set target = $argv[0]
	else
		set target = (git rev-parse --show-toplevel)
	end
	gittower $target
end
