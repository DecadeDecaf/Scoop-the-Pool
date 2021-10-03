var bot = g.Players[@ Num]
var spr = spr_RosaBubble

switch (bot.Bot) {
	case "Reserved Rosa": spr = spr_RosaBubble; break
	case "High-roller Hannah": spr = spr_HannahBubble; break
	case "Whatever Walter": spr = spr_WalterBubble; break
	case "Calculated Cal": spr = spr_CalBubble; break
	case "GameShark Mark": spr = spr_MarkBubble; break
	case "Cheetah Charli": spr = spr_CharliBubble; break
}

sprite_index = spr
image_index = bot.Betting

var frame = floor(g.FrameCount / 20)

if (g.Turn != Num) {
	if (bot.Out) {
		draw_sprite(spr_Out, 0, x, y)
	} else {
		draw_self()
	}
} else {
	draw_sprite(spr_Waiting, frame, x, y)
}