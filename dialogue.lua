dialogue = {
	["test"] = {
		[1] = {
			["intro"] = "hey bud",
			["success"] = "here have some timbits",
			["fail"] = "get yer own timbits bud",
			["minscore"] = 1,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "compliment toque",
						[2] = "offer to shovel driveway",
						[3] = "apologize",
					},
					["responses"] = {
						[1] = "thanks bud",
						[2] = "I'm homeless, asshole, I don't have a driveway",
						[3] = "don't worry aboot it!",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
						[3] = "positive",
					},
				},
				[2] = {
					["options"] = {
						[1] = "apologize",
						[2] = "explain that their favorite hockey player is bad",
					},
					["responses"] = {
						[1] = "it's okay, bud",
						[2] = "You can fuck off, eh, bud?",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
					},
				},
			},
		},
		[2] = {
			["intro"] = "hello",
			["success"] = "here have some poutine",
			["fail"] = "get yer own poutine bud",
			["minscore"] = 2,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "offer to clear driveway with flamethrower",
						[2] = "compliment plaid",
						[3] = "apologize",
					},
					["responses"] = {
						[1] = "what are you, some kind of american?",
						[2] = "thanks bud",
						[3] = "what for?",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "tell them they look like a doughhead",
						[2] = "ask if they want to watch hockey",
					},
					["responses"] = {
						[1] = "That's not nice!",
						[2] = "Sure thing, bud",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",			
					},
				},
			},
		},
	},
	["pizza"] = {
		[1] = {
			["intro"] = "hey bud",
			["success"] = "here have some timbits",
			["fail"] = "get yer own timbits bud",
			["minscore"] = 1,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "compliment toque",
						[2] = "offer to shovel driveway",
						[3] = "apologize",
					},
					["responses"] = {
						[1] = "thanks bud",
						[2] = "I'm homeless, asshole, I don't have a driveway",
						[3] = "don't worry aboot it!",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
						[3] = "positive",
					},
				},
				[2] = {
					["options"] = {
						[1] = "aaaaaaaa",
						[2] = "aaaaaaaa",
					},
					["responses"] = {
						[1] = "aaaaaaaa",
						[2] = "aaaaaaaa",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
					},
				},
			},
		},
		[2] = {
			["intro"] = "hello",
			["success"] = "here have some poutine",
			["fail"] = "get yer own poutine bud",
			["minscore"] = 2,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "offer to clear driveway with flamethrower",
						[2] = "compliment plaid",
						[3] = "apologize",
					},
					["responses"] = {
						[1] = "what are you, some kind of american?",
						[2] = "thanks bud",
						[3] = "what for?",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "aaa",
						[2] = "aaa",
					},
					["responses"] = {
						[1] = "aaa",
						[2] = "aaa",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
					},
				},
			},
		},
	},
	["tutorial"] = {
		[1] = {
			["intro"] = "Narrator: Alright, now just let's see if you can get some food from this person.",
			["success"] = "You know what, you seem like a good fella, have some timbits!",
			["fail"] = "This should literally be unreachable, if you're seeing this then something went wrong. Like how did this even happen???",
			["minscore"] = 1,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Attempt to steal food",
						[2] = "Threaten with acts of extreme violence",
						[3] = "Just straight up end their life",
					},
					["responses"] = {
						[1] = "Narrator: Woah woah woah, what do you think you’re doing?!? You’re Canadian, you can’t just attack some random person! I don’t even think you guys are capable of that sort of thing. Nah, you gotta do this the Canadian way. Go on, try again.",
						[2] = "Narrator: Woah woah woah, what do you think you’re doing?!? You’re Canadian, you can’t just attack some random person! I don’t even think you guys are capable of that sort of thing. Nah, you gotta do this the Canadian way. Go on, try again.",
						[3] = "Narrator: Woah woah woah, what do you think you’re doing?!? You’re Canadian, you can’t just attack some random person! I don’t even think you guys are capable of that sort of thing. Nah, you gotta do this the Canadian way. Go on, try again.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "negative",
						[3] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Apologize",
						[2] = "Compliment their hockey skates",
						[3] = "Offer to build them a new fence",
					},
					["responses"] = {
						[1] = "Oh, no problem at all, bud.",
						[2] = "Oh, well thanks there, bud. That's real nice of you.",
						[3] = "That's very kind, bud. That's okay though, I don't have a home anymore.",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "positive",
						[3] = "positive",
					},
				},
			},
		},
	},
	["level1"] = {
		[1] = {
			["intro"] = "How's it going there, bro? Need something?",
			["success"] = "Thanks for stopping to chat, bud. Have some poutine.",
			["fail"] = "Can you quit bothering me, ya hoser? Can't ya see I'm busy.",
			["minscore"] = 1,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Apologize",
						[2] = "Insult their snowblower",
						[3] = "Perform an immaculate moose call",
					},
					["responses"] = {
						[1] = "Oh, no problem at all, bud.",
						[2] = "You dare insult Delila, bud? ",
						[3] = "That's a pretty impressive call you got there, bud.",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
						[3] = "positive",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Offer to shine their skates",
						[2] = "Apologize",
						[3] = "Suggest they wear something other than plaid",
					},
					["responses"] = {
						[1] = "What a nice offer, thanks bud.",
						[2] = "Oh, not problem at all, bud.",
						[3] = "You making a joke there, ya hoser?",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "positive",
						[3] = "negative",
					},
				},
			},
		},
	},
	["template"] = {
		[1] = {
			["intro"] = "",
			["success"] = "",
			["fail"] = "",
			["minscore"] = 1,
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "",
						[2] = "",
						[3] = "",
					},
					["responses"] = {
						[1] = "",
						[2] = "",
						[3] = "",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "negative",
						[3] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "",
						[2] = "",
						[3] = "",
					},
					["responses"] = {
						[1] = "",
						[2] = "",
						[3] = "",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "positive",
						[3] = "positive",
					},
				},
			},
		},
	},
}
