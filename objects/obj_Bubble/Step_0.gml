if (position_meeting(mouse_x, mouse_y, id) && g.Turn > 0) {
	Size += 0.01
	Size = min(Size, 1)
	if (mouse_check_button_pressed(mb_left)) {
		g.Players[@ 0].Betting = !g.Players[@ 0].Betting
	}
} else {
	Size -= 0.01
	Size = max(Size, 0.96)
}