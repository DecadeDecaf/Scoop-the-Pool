draw_set_color($512041)
draw_set_alpha(0.25)

draw_rectangle(x - 75, y + 125, x + 85, y + 240, false)

draw_set_alpha(1)

draw_sprite_ext(spr_Chip, 0, x - 40, y + 155, 0.65, 0.65, 0, -1, 1)
draw_sprite_ext(spr_Wager, 0, x - 40, y + 205, 0.65, 0.65, 0, -1, 1)

var bot = g.Players[@ Num]

draw_set_color($6A485C)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

var txty = 8

draw_text_transformed(x + 10, y + 155 + txty, string(bot.Chips), 0.85, 0.85, 0)
draw_text_transformed(x + 10, y + 205 + txty, string(bot.Wager), 0.85, 0.85, 0)

draw_set_color($C9DADC)
txty = 6

draw_text_transformed(x + 13, y + 155 + txty, string(bot.Chips), 0.85, 0.85, 0)
draw_text_transformed(x + 13, y + 205 + txty, string(bot.Wager), 0.85, 0.85, 0)