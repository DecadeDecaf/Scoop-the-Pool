function next_turn() {
	if (g.Turn == -1) {
		exit
	}
	var players = array_length(g.Players)
	g.Turn += 1
	if (g.Turn >= players) {
		g.Turn = 0
	}
	var out = g.Players[@ g.Turn].Out
	if (out) {
		next_turn()
	} else {
		start_turn()
	}
}

function start_turn() {
	var players = array_length(g.Players)
	var turnplayer = g.Players[@ g.Turn]
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (player.Bot == "GameShark Mark" && !player.Out && player.Quirky && g.Turn != i) {
			turnplayer.Chips -= 1
			player.Chips += 1
		}
	}
	blind_bets()
	cpu_wagers()
	cpu_cards()
}

function rand_card() {
	return choose(
		"Vanilla",
		"Chocolate",
		"Strawberry",
		"Cookies and Cream",
		"Buttered Pecan",
		"Cookie Dough",
		"Green Mint Chip",
		"Neapolitan",
		"Moose Tracks",
		"Rocky Road",
		"Tutti Frutti",
		"Cotton Candy",
		"French Vanilla",
		"Coffee"
	)
}

function draw_card(player) {
	var hand = g.Players[@ player].Hand
	array_push(hand, rand_card())
}

function play_card(player, card) {
	var hand = g.Players[@ player].Hand
	var name = hand[@ card]
	array_remove_at(hand, card)
	card_process(name)
	stack_process()
	draw_card(player)
}

function stack_process() {
	if (g.Balance > g.BalanceWindow || g.Balance < -g.BalanceWindow) {
		split_pot()
		topple()
	} else {
		add_to_pot()
	}
	wipe_wagers()
	next_turn()
}

function topple() {
	var scoops = array_length(g.Stack)
	var lean = g.Balance * 3
	var xx = 960 + (g.Balance * 4)
	var yy = 585
	var dir = 90 - (g.Balance * 4)

	for (var i = 0; i < scoops; i++) {
		var flav = card_id(g.Stack[@ i])
		var scoop = instance_create_depth(xx, yy, 5, obj_Scoop)
		scoop.image_index = flav
		scoop.image_angle = dir - 90
		dir -= lean
		xx += lengthdir_x(50, dir)
		yy += lengthdir_y(50, dir)
	}
	
	g.Balance = 0
	g.BalanceWindow = 4
	g.Stack = []
}

function wipe_wagers() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		player.Betting = false
		if (player.Chips <= 0) {
			player.Out = true
			if (i == 0) {
				g.Turn = -1
			}
		}
	}
	g.PlayerReady = false
}

function bench_players() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (player.Out) {
			player.Chips = 0
		}
	}
}

function cpu_wagers() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (i != g.Turn && player.CPU && !player.Out) {
			var total = 14
			var cheat = false
			if (player.Bot == "Cheetah Charli" && player.Quirky) {
				cheat = true
				total += 6 // change total cards from 14 to 20
			}
			var strictness = floor(total / 2)
			if (player.Bot == "Reserved Rosa" && player.Quirky) {
				strictness += 2
			}
			if (player.Bot == "High-roller Hannah" && player.Quirky) {
				strictness -= 2
			}
			var risk = choose(-1, 1)
			if (player.Bot == "Calculated Cal" && player.Quirky) {
				risk = 0
			}
			var tries = (risk > 0 ? total - strictness: strictness)
			repeat (tries) {
				if (random_range(0, 100) > 25) {
					strictness += risk
				} else {
					break
				}
			}
			if (player.Bot == "Whatever Walter" && player.Quirky) {
				player.Betting = choose(true, false)
			} else {
				var odds = weigh_odds(cheat)
				player.Betting = (odds > strictness || (odds == strictness && choose(true, false)))
			}
		}
	}
}

function cpu_cards() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (i == g.Turn && player.CPU && g.PlayerReady && !player.Out) {
			var safe = []
			for (var c = 0; c < 3; c++) {
				var card = player.Hand[@ c]
				if (!card_test(card)) {
					array_push(safe, c)
				}
			}
			var best = irandom_range(0, 2)
			var safeoptions = array_length(safe)
			var risk = 5
			if (player.Bot == "Calculated Cal" && player.Quirky) {
				risk = 0
			}
			if (safeoptions > 0 && random_range(0, 100) >= risk) {
				best = safe[@ irandom_range(0, safeoptions - 1)]
			}
			if (player.Bot == "Whatever Walter" && player.Quirky) {
				best = irandom_range(0, 2)
			}
			play_card(g.Turn, best)
		}
	}
}

function weigh_odds(cheat) {
	var topplers = 0
	for (var i = 0; i < 14; i++) {
		if (card_test(card_name(i))) {
			topplers += 1
		}
	}
	if (cheat) {
		for (var i = 0; i < 3; i++) {
			if (card_test(g.Players[@ g.Turn].Hand[@ i])) {
				topplers += 2
			}
		}
	}
	return topplers
}

function blind_bets() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (i != g.Turn && !player.Out) {
			if (player.Chips >= 5) {
				player.Chips -= 5
				player.Wager += 5
			} else if (player.Chips <= 0) {
				player.Out = true
				if (i == 0) {
					g.Turn = -1
				}
			} else {
				player.Wager += player.Chips
				player.Chips = 0
			}
		}
	}
}

function add_to_pot() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (i != g.Turn && !player.Out) {
			if (player.Betting) {
				g.Pot += player.Wager
			} else {
				player.Chips += player.Wager
			}
			player.Wager = 0
		}
	}
}

function split_pot() {
	var players = array_length(g.Players)
	for (var i = 0; i < players; i++) {
		var player = g.Players[@ i]
		if (i != g.Turn && !player.Out) {
			if (!player.Betting) {
				g.Pot += player.Wager
			} else {
				player.Chips += player.Wager
			}
			player.Wager = 0
		}
	}
	var p = g.Pot // timeout
	while (g.Pot > 0 && p > 0) {
		for (var i = 0; i < players; i++) {
			var player = g.Players[@ i]
			if (i != g.Turn && !player.Out) {
				if (player.Betting) {
					g.Pot -= 1
					player.Chips += 1
				}
			}
		}
		p--
	}
	g.Pot = 0
}

function card_id(card) {
	var cid = -1
	switch (card) {
		case "Vanilla": cid = 0; break
		case "Chocolate": cid = 1; break
		case "Strawberry": cid = 2; break
		case "Cookies and Cream": cid = 3; break
		case "Buttered Pecan": cid = 4; break
		case "Cookie Dough": cid = 5; break
		case "Green Mint Chip": cid = 6; break
		case "Neapolitan": cid = 7; break
		case "Moose Tracks": cid = 8; break
		case "Rocky Road": cid = 9; break
		case "Tutti Frutti": cid = 10; break
		case "Cotton Candy": cid = 11; break
		case "French Vanilla": cid = 12; break
		case "Coffee": cid = 13; break
	}
	return cid
}

function card_name(card) { // i know i should've used an enum/array/dict, leave me alone!
	var cname = ""
	switch (card) {
		case 0: cname = "Vanilla"; break
		case 1: cname = "Chocolate"; break
		case 2: cname = "Strawberry"; break
		case 3: cname = "Cookies and Cream"; break
		case 4: cname = "Buttered Pecan"; break
		case 5: cname = "Cookie Dough"; break
		case 6: cname = "Green Mint Chip"; break
		case 7: cname = "Neapolitan"; break
		case 8: cname = "Moose Tracks"; break
		case 9: cname = "Rocky Road"; break
		case 10: cname = "Tutti Frutti"; break
		case 11: cname = "Cotton Candy"; break
		case 12: cname = "French Vanilla"; break
		case 13: cname = "Coffee"; break
	}
	return cname
}

function card_process(card) {
	array_push(g.Stack, card)
	switch (card) {
		case "Vanilla": break
		case "Chocolate": g.Balance -= 1; break
		case "Strawberry": g.Balance += 1; break
		case "Cookies and Cream": g.Balance -= 2; break
		case "Buttered Pecan": g.Balance += 2; break
		case "Cookie Dough": g.Balance -= 3; break
		case "Green Mint Chip": g.Balance += 3; break
		case "Neapolitan": g.Balance = 0; break
		case "Moose Tracks": g.BalanceWindow -= 1; break
		case "Rocky Road": g.BalanceWindow -= 1; break
		case "Tutti Frutti": g.BalanceWindow -= 2; break
		case "Cotton Candy": g.Balance = 0; g.BalanceWindow -= 1; break
		case "French Vanilla": blind_bets(); break
		case "Coffee": g.BalanceWindow = -1; break
	}
}

function card_test(card) {
	var bal = g.Balance
	var win = g.BalanceWindow
	switch (card) {
		case "Vanilla": break
		case "Chocolate": bal -= 1; break
		case "Strawberry": bal += 1; break
		case "Cookies and Cream": bal -= 2; break
		case "Buttered Pecan": bal += 2; break
		case "Cookie Dough": bal -= 3; break
		case "Green Mint Chip": bal += 3; break
		case "Neapolitan": bal = 0; break
		case "Moose Tracks": win -= 1; break
		case "Rocky Road": win -= 1; break
		case "Tutti Frutti": win -= 2; break
		case "Cotton Candy": bal = 0; win -= 1; break
		case "French Vanilla": break
		case "Coffee": bal = -1; break
	}
	return (bal > win || bal < -win)
}