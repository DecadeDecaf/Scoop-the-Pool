if (Type == "Playing") {
	image_index = !g.Players[@ Num].Out
} else {
	image_index = g.Players[@ Num].Quirky
}

image_xscale = Size
image_yscale = Size

draw_self()