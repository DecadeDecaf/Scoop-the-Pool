image_index = g.Players[@ 0].Betting

image_xscale = Size
image_yscale = Size

draw_self()

if (g.Turn == 0 || g.Turn == -1) {
	gpu_set_fog(true, $6A485C, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 0.5)
	gpu_set_fog(false, $000000, 0, 0)
} else {
	var lift = (Size - 0.96) * 120
	draw_sprite_ext(spr_WideControls, 0, x - 65 - lift, y - 145 - (lift * 2.25), 0.65, 0.65, 0, -1, 1)
	draw_sprite_ext(spr_WideControls, 1, x + 65 + lift, y - 145 - (lift * 2.25), 0.5, 0.5, 0, -1, 1)
}