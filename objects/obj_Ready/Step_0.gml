if (position_meeting(mouse_x, mouse_y, id) && (g.Turn > 0 || room == rm_Menu)) {
	Size += 0.01
	Size = min(Size, 0.75)
	if (mouse_check_button_pressed(mb_left)) {
		if (room == rm_Menu) {
			room_goto(rm_Game)
		} else {
			g.PlayerReady = true
			cpu_cards()
		}
	}
} else {
	Size -= 0.01
	Size = max(Size, 0.71)
}