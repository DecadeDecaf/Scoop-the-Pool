if (position_meeting(mouse_x, mouse_y, id) && g.Turn == 0) {
	Size += 0.01
	Size = min(Size, 0.74)
	if (mouse_check_button_pressed(mb_left)) {
		play_card(0, Num)
	}
} else {
	Size -= 0.01
	Size = max(Size, 0.7)
}