var bot = g.Players[@ Num]
var spr = spr_Rosa

switch (bot.Bot) {
	case "Reserved Rosa": spr = spr_Rosa; break
	case "High-roller Hannah": spr = spr_Hannah; break
	case "Whatever Walter": spr = spr_Walter; break
	case "Calculated Cal": spr = spr_Cal; break
	case "GameShark Mark": spr = spr_Mark; break
	case "Cheetah Charli": spr = spr_Charli; break
}

var frame = floor(g.FrameCount / 20)

sprite_index = spr
image_index = frame

if (bot.Out) {
	image_index = 0
}

draw_self()

if (g.Turn != Num) {
	gpu_set_fog(true, $6A485C, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 0.33)
	gpu_set_fog(false, $000000, 0, 0)
}