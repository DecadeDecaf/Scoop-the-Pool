image_xscale = Size
image_yscale = Size

draw_self()

if (g.Turn == 0 && room != rm_Menu) {
	gpu_set_fog(true, $6A485C, 0, 0)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, -1, 0.5)
	gpu_set_fog(false, $000000, 0, 0)
} else {
	var lift = (Size - 0.71) * 90
	draw_sprite_ext(spr_WideControls, 2, x, y - 170 - (lift * 2.25), 0.65, 0.65, 0, -1, 1)
	draw_sprite_ext(spr_WideControls, 3, x, y - 115 - (lift * 2.25), 0.65, 0.65, 0, -1, 1)
}