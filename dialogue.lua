dialogue = {
	["tutorial"] = {
		[1] = {
			["intro"] = "Narrator: Alright, now just let's see if you can get some food from this person.",
			["success"] = "You know what, you seem like a good fella, have some Timbits™!",
			["fail"] = "This should literally be unreachable, if you're seeing this then something went wrong. Like how did this even happen???",
			["minscore"] = 1,
			["food"] = "Timbits™",
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
			["food"] = "Poutine",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Apologize",
						[2] = "Insult their snowblower",
						[3] = "Perform an immaculate moose call",
					},
					["responses"] = {
						[1] = "Oh, no problem at all, bud.",
						[2] = "You dare insult Delila, bud? Best watch your mouth there.",
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
		[2] = {
			["intro"] = "Man, looks like I have just enough food for my poor starving family. Better get back to them. Oh, hey there bud, did you need something?",
			["success"] = "You know, I was going to give this to my poor starving children, but I think you should have it.",
			["fail"] = "Kids these days, don't got any manners.",
			["minscore"] = 1,
			["food"] = "Timbits™",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Insult their children",
						[2] = "Offer to teach their children their ABCs",
						[3] = "Apologize",
					},
					["responses"] = {
						[1] = "Hey now, those are my kids. Ya can't just go oot and aboot and say those kinds of things!",
						[2] = "Very kind of you, bud. How aboot you stop by next Thursday?",
						[3] = "Oh, no problem at all, bud.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "positive",
					},
				},
			},
		},
	},
	["level2"] = {
		[1] = {
			["intro"] = "Nice day for some ice fishing, eh bud?",
			["success"] = "You know what bud, have some poutine. A gift, from one ice fishing enthusiast to another.",
			["fail"] = "Why don't you just go bother someone else, eh?",
			["minscore"] = 1,
			["food"] = "Poutine",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Suggest going ice fishing with them later that day",
						[2] = "Compliment their ice hut",
						[3] = "Insult the size of their fishing rod",
					},
					["responses"] = {
						[1] = "That'd be great bud, I'll clear my schedule.",
						[2] = "Thanks bud, my great-great-great grandpa Herb made that there ice hut. Been in the family ever since. I love that ice hut, it's like my best friend.",
						[3] = "Now just hold up a sec there, ya hoser. It ain't all about the size of yer fishing pole.",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "positive",
						[3] = "negative",
					},
				},
			},
		},
		[2] = {
			["intro"] = "How's it going there bud, you're looking a bit peckish. Say, how about this. If you guess the outcome of this coin flip I'll give ya some Timbits™. How's that sound, eh?",
			["success"] = "Well, rules are rules, have some Timbits™.",
			["fail"] = "Not sure how you screwed this up, bud. This game was literally rigged for you to win and you somehow screwed this up. I got nothin' for ya.",
			["minscore"] = 1,
			["food"] = "Timbits™",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Heads",
						[2] = "Tails",
						[3] = "Tell them this is stupid",
					},
					["responses"] = {
						[1] = "Sorry bud, looks like it's tails. You know what, I'll give you another chance, try again.",
						[2] = "Sorry bud, looks like it's heads. You know what, I'll give you another chance, try again.",
						[3] = "Sorry bud, I don't think stupid is a side on a coin, try again.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "negative",
						[3] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Heads",
						[2] = "Tails",
						[3] = "Side",
					},
					["responses"] = {
						[1] = "Well look at that, it's heads!",
						[2] = "Well look at that, it's tails!",
						[3] = "What in... it really did land on its side! Well I'll be darned...",
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
	["level3"] = {
		[1] = {
			["intro"] = "Welcome to Pizza Town, bud. This is where they created the famed Hawaiian pizza! What can I do for ya?",
			["success"] = "Here ya go bud, have a slice on the house!",
			["fail"] = "Get out of my face, ya pineapple-hatin' hoser!",
			["minscore"] = 1,
			["food"] = "Pizza",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Insult pineapple on pizza",
						[2] = "Ask for a slice",
						[3] = "Praise pineapple for the almighty fruit that it is",
					},
					["responses"] = {
						[1] = "You dare come into Pizza town and utter such heresy?!",
						[2] = "Well sure thing, bud.",
						[3] = "Right you are, bud. Right you are.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "positive",
					},
				},
			},
		},
		[2] = {
			["intro"] = "Hope you're liking Pizza Town, bud. What can I do for ya, eh?",
			["success"] = "It's always nice to see a welcome face in Pizza Town",
			["fail"] = "Never show your face in Pizza Town again, ya hoser!",
			["minscore"] = 1,
			["food"] = "Pizza",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Compliment their toque",
						[2] = "Offer to shovel their driveway",
					},
					["responses"] = {
						[1] = "I'm only wearing this to hide my bald head...",
						[2] = "I'm homeless, ya hoser, I don't have a driveway! How rude...",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "negative",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Apologize",
						[2] = "Explain that their favorite hockey player is in fact, the worst",
					},
					["responses"] = {
						[1] = "Oh, don't worry aboot it bud.",
						[2] = "You can fuck right off, eh, bud?",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
					},
				},
			},
		},
	},
	["level4"] = {
		[1] = {
			["intro"] = "Hey there bud, didn't expect to see someone so far North. Usually they stop in pizza town since they got an infinite supply of pizza. Oh well, ya can't go back now. What can I do for ya?",
			["success"] = "Well gee, it sure has been a while since I talked to a nice folk like yourself. Have this poutine.",
			["fail"] = "I don't know about you, bud. Why don't you move along.",
			["minscore"] = 2,
			["food"] = "Poutine",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Suggest a short game of hockey",
						[2] = "Suggest that they go stuff their head in a snow bank",
						[3] = "Compliment their snowmobile",
					},
					["responses"] = {
						[1] = "I sure would love to, bud. Sadly I left my skates at home, maybe next time.",
						[2] = "Well that's not very nice, ya hoser.",
						[3] = "Thanks bud, I just polished her this morning. Send it!",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
						[3] = "positive",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Throw a snowball at them",
						[2] = "Say sorry",
						[3] = "Lick their snowmobile",
					},
					["responses"] = {
						[1] = "Woah there bud, that was awful rude of you, eh.",
						[2] = "Oh wow, I haven't heard a quality sorry like that in a while. Thanks, I needed that.",
						[3] = "Excuse me there, bud. Would you mind backing away from the snowmobile.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "negative",
					},
				},
			},
		},
	},
	["level5"] = {
		[1] = {
			["intro"] = "Another person, I haven't seen another person in months. Are you looking for the Great Refrigerator too? I've just aboot run oot of supplies looking for it. What can I do for ya?",
			["success"] = "Well, I am almost out of food, and will probably die if I give these to you, but you seem like a nice guy. So here, have these Timbits™, and good luck!",
			["fail"] = "Well, I've got nothing for you, but good luck looking for the Great Refrigerator.",
			["minscore"] = 2,
			["food"] = "Timbits™",
			["stages"] = {
				[1] = {
					["options"] = {
						[1] = "Inform them that their search has been pointless",
						[2] = "Applaud their tenacity to continue the search",
						[3] = "Compliment their snowshoes",
					},
					["responses"] = {
						[1] = "Ouch bud, don't ya know that the truth hurts...",
						[2] = "Thanks bud, but I'm not sure how much I have left in me.",
						[3] = "Oh these? Yeah I found them out by that tree over there. Seems like the previous owner got mauled by a polar bear. But hey, they seem to still be working just fine.",
					},
					["outcomes"] = {
						[1] = "negative",
						[2] = "positive",
						[3] = "positive",
					},
				},
				[2] = {
					["options"] = {
						[1] = "Offer to take over the search for them",
						[2] = "Distract them with the classic look over there tactic",
						[3] = "Throw a ski at them",
					},
					["responses"] = {
						[1] = "Thanks bud, I was thinking about heading back anyway.",
						[2] = "What? What's over... Oh, you sneaky hoser you.",
						[3] = "Oi, what was that for, ya hoser?!",
					},
					["outcomes"] = {
						[1] = "positive",
						[2] = "negative",
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
			["food"] = "",
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
