hl.env("AQ_DRM_DEVICES", "/dev/dri/intel-gpu:/dev/dri/nvidia-gpu")

hl.config({
	input = {
		kb_options = "caps:swapescape",

		touchpad = {
			scroll_factor = 0.2,
			natural_scroll = true
		}
	},

	xwayland = {
		force_zero_scaling = true
	}
})
