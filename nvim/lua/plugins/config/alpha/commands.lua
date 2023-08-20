local function cow()
	local cowfiles = { "beavis.zen", "blowfish", "bong", "bud-frogs", "bunny", "cheese", "cower", "daemon", "default",
		"dragon",
		"dragon-and-cow", "elephant", "elephant-in-snake", "eyes", "flaming-sheep", "ghostbusters",
		"head-in", "hellokitty", "kiss", "kitty", "koala", "kosh", "luke-koala", "meow", "milk", "moofasa", "moose",
		"mutilated", "ren", "satanic", "sheep", "skeleton", "small", "stegosaurus", "stimpy", "supermilker",
		"surgery", "three-eyes", "turkey", "turtle", "tux", "udder", "vader", "vader-koala", "www" }

	local cowfile = cowfiles[math.random(#cowfiles)]
	return "fortune -s  | cowsay -f " .. cowfile
end

local function rainbow_cow()
	local cowfiles = { "beavis.zen", "blowfish", "bong", "bud-frogs", "bunny", "cheese", "cower", "daemon", "default",
		"dragon",
		"dragon-and-cow", "elephant", "elephant-in-snake", "eyes", "flaming-sheep", "ghostbusters",
		"head-in", "hellokitty", "kiss", "kitty", "koala", "kosh", "luke-koala", "meow", "milk", "moofasa", "moose",
		"mutilated", "ren", "satanic", "sheep", "skeleton", "small", "stegosaurus", "stimpy", "supermilker",
		"surgery", "three-eyes", "turkey", "turtle", "tux", "udder", "vader", "vader-koala", "www" }

	local cowfile = cowfiles[math.random(#cowfiles)]
	return "fortune -s  | cowthink -f " .. cowfile .. "| lolcat -t"
end

local function matrix(message)
	if message == nil or message == "" then
		--    return "MESSAGE=$(echo '' && figlet 'Coffee!') && cmatrix -u 10 -M $MESSAGE"
		return "cmatrix -u 10 -br"
	end

	return "cmatrix -u 10 -M" .. message
end

local function go_brr()
	return 'while true; do; for x in code go brr; do; toilet --gay -f mono12 "$x"; sleep 1; clear; done; done;'
end

local function timer()
	return
	'while true; do; for x in it is time to pick go now hurryyyy; do; toilet --gay -f mono12 "$x"; sleep 1; clear; done; done;'
end

local function go_code(message, style)
	if not message then
		message = "herbie"
	end

	if not style then
		style = "starwars"
	end
	return "figlet -c -f " .. style .. " " .. message .. " | lolcat && while true"
end


return {
	cow = cow,
	rainbow_cow = rainbow_cow,
	matrix = matrix,
	go_brr = go_brr,
	timer = timer,
	go_code = go_code
}
