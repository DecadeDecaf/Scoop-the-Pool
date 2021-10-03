var one = keyboard_check_pressed(ord("1")) || gamepad_button_check(0, gp_face3)
var two = keyboard_check_pressed(ord("2")) || gamepad_button_check(0, gp_face1)
var three = keyboard_check_pressed(ord("3")) || gamepad_button_check(0, gp_face2)

var ready = keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_start)
var bet = keyboard_check_pressed(vk_shift) || gamepad_button_check(0, gp_face4)

if (g.Turn == 0) {
	if (one) { play_card(0, 0) }
	if (two) { play_card(0, 1) }
	if (three) { play_card(0, 2) }
} else {
	if (ready) { g.PlayerReady = true; cpu_cards() }
	if (bet) { g.Players[@ 0].Betting = !g.Players[@ 0].Betting }
}