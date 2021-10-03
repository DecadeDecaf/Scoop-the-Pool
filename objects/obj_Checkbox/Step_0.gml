if (position_meeting(mouse_x, mouse_y, id)) {
	Size += 0.01
	Size = min(Size, 0.26)
	if (mouse_check_button_pressed(mb_left)) {
		if (Type == "Playing") {
			g.Players[@ Num].Out = !g.Players[@ Num].Out
		} else {
			g.Players[@ Num].Quirky = !g.Players[@ Num].Quirky
		}
	}
} else {
	Size -= 0.01
	Size = max(Size, 0.22)
}