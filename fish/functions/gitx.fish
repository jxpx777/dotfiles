function gitx
	if $argv[0] == ""
		gittower (git rev-parse --show-toplevel)
	else
		gittower $argv[0]
	end
end
