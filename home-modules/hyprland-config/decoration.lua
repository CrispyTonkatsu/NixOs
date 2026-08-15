hl.env("HYPRCURSOR_THEME", "rose-pine-cursor")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("GDK_SCALE", "2")
hl.env("XCURSOR_SIZE", "2")

hl.config({
	master = {
		enabled = true
	},

	general = {
		border_size = 2,
		col = {
			active_border = "rgb(944956) rgb(c0c5d4) 45deg"
		},

		gaps_in = 2,
		gaps_out = 2,
	},

	decoration = {
		blur = {
			enabled = true
		},

		rounding = 3
	},
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	style = "slidevert"
})
