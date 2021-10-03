draw_set_font(fnt_Font)

var p1 = g.Players[@ 0]

draw_set_color($512041)
draw_set_alpha(0.25)

draw_rectangle(15, 840, 185, 1065, false)

draw_set_alpha(1)

draw_sprite_ext(spr_Chip, 0, 50, 875, 0.75, 0.75, 0, -1, 1)
draw_sprite_ext(spr_Wager, 0, 50, 950, 0.75, 0.75, 0, -1, 1)
draw_sprite_ext(spr_Pot, 0, 50, 1025, 0.75, 0.75, 0, -1, 1)

draw_set_color($6A485C)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

var txty = 10

draw_text_transformed(80, 875 + txty, string(p1.Chips), 0.85, 0.85, 0)
draw_text_transformed(80, 950 + txty, string(p1.Wager), 0.85, 0.85, 0)
draw_text_transformed(80, 1025 + txty, string(g.Pot), 0.85, 0.85, 0)

draw_set_color($C9DADC)
txty = 8

draw_text_transformed(83, 875 + txty, string(p1.Chips), 0.85, 0.85, 0)
draw_text_transformed(83, 950 + txty, string(p1.Wager), 0.85, 0.85, 0)
draw_text_transformed(83, 1025 + txty, string(g.Pot), 0.85, 0.85, 0)

var window = -1

switch (g.BalanceWindow) {
	case 4: window = 0; break
	case 3: window = 1; break
	case 2: window = 2; break
	case 1: window = 3; break
	case 0: window = 4; break
	default: window = -1; break
}

draw_sprite_ext(spr_Cone, 0, 960, 640, 0.5, 0.5, 0, -1, 1)

var scoops = array_length(g.Stack)

var shake = (4 - (g.BalanceWindow - abs(g.Balance))) / 2
var lean = g.Balance * 3

var xx = 960 + (g.Balance * 4)
var yy = 585
var dir = 90 - (g.Balance * 4)

for (var i = 0; i < scoops; i++) {
	var flav = card_id(g.Stack[@ i])
	var shakex = random_range(-shake, shake)
	var shakey = random_range(-shake, shake)
	draw_sprite_ext(spr_Scoops, flav, xx + shakex, yy + shakey, 0.5, 0.5, dir - 90, -1, 1)
	dir -= lean
	xx += lengthdir_x(50, dir)
	yy += lengthdir_y(50, dir)
}

if (window != -1) {
	draw_sprite_ext(spr_Balance, window, 960, 75, 0.75, 0.75, 0, -1, 1)
	draw_sprite_ext(spr_Marker, 0, 960 + (g.Balance * 36), 75, 0.75, 0.75, 0, -1, 1)
}