hl.env("HYPRCURSOR_THEME", "rose-pine-cursor")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_SCALE", "2")
hl.env("XCURSOR_SIZE", "2")

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 4,
	},

	decoration = {
		blur = {
			enabled = true
		},
	},
})

hl.curve("ease_in_out_exp", {
	type = "bezier",
	points = {},
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	curve = "default",
	style = "slidevert"
})
