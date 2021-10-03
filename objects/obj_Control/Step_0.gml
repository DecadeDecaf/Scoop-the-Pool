var f = keyboard_check_pressed(ord("F"))
var r = keyboard_check_pressed(ord("R"))

if (f) {
	var full = window_get_fullscreen()
	window_set_fullscreen(!full)
	if (full) {
		window_set_size(960, 540)
	} else {
		window_set_size(1920, 1080)
	}
}

if (r) {
	game_restart()
}

var ready = keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_start)

if (ready && room == rm_Menu) {
	room_goto(rm_Game)
}

g.FrameCount += 1