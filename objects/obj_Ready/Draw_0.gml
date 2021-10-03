image_xscale = Size
image_yscale = Size

if (g.Turn == -1) {
	draw_sprite(spr_Out, 0, x, y)
	draw_set_color($6A485C)
	draw_set_halign(fa_center)
	draw_text_transformed(x, y + 100, "press R to return\nto the menu", 0.5, 0.5, 0)
	exit
}

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