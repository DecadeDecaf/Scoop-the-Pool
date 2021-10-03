image_index = card_id(g.Players[@ 0].Hand[@ Num])

image_xscale = Size
image_yscale = Size

draw_self()

if (g.Turn != 0) {
	gpu_set_fog(true, $6A485C, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 0.33)
	gpu_set_fog(false, $000000, 0, 0)
} else {
	var lift = (Size - 0.7) * 200
	draw_sprite_ext(spr_Controls, Num, x - 125 - lift, y - 355 - (lift * 2.25), 0.65, 0.65, 0, -1, 1)
	draw_sprite_ext(spr_Controls, Num + 3, x + 125 + lift, y - 355 - (lift * 2.25), 0.5, 0.5, 0, -1, 1)
}