#macro g global

randomize()

audio_master_gain(0.5)
g.Mute = false
g.FrameCount = 0

g.Turn = 0
g.Pot = 0

g.Balance = 0
g.BalanceWindow = 4

g.PlayerReady = false

g.Players = [
	{
		CPU: false,
		Bot: "",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "Reserved Rosa",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "High-roller Hannah",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "Whatever Walter",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "Calculated Cal",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "GameShark Mark",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	},
	{
		CPU: true,
		Bot: "Cheetah Charli",
		Quirky: false,
		Hand: [rand_card(), rand_card(), rand_card()],
		Betting: false,
		Chips: 25,
		Wager: 0,
		Out: false
	}
]

g.Stack = []

audio_play_sound(snd_Game, 1, true)