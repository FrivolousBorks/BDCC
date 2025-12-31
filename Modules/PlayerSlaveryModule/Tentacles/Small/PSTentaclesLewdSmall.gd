extends SceneBase

func _init():
	sceneID = "PSTentaclesLewdSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	#if(possible.empty()):
	#	possible.append("0")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))
	

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		if (_tentacles.lust <= 0):
			saynn("The tentacles approach you.. they seem.. interested in you?")

			saynn("A few of them slowly extend toward you.. stopping a foot or so away. Their tips gently sway in the air.. just observing. They make no move to touch.. they're just observing your presence.")

		elif (_tentacles.lust <= 2):
			saynn("The tentacles approach you.. they seem.. kinda curious.")

			saynn("A few of them drift even closer, almost within brushing distance. Their tips gently sway in the air, observing you and your body. One of the tendrils does a quick light tap on your wrist before quickly retreating.")

		elif (_tentacles.lust <= 5):
			saynn("The tentacles approach you, one of them loosely curls around your wrist already.. like it's holding your hand or something.")

			saynn("The rest are just observing your body, their tips are slick with juices while tracing the outer counters of your hips and thighs.. occasionally brushing against them.")

			saynn("They sure seem a lot more touchy now.")

		elif (_tentacles.lust <= 8):
			saynn("The tentacles approach you and eagerly coil around your chest and hips, embracing you. They wrap around your arms and legs too.. not tightly.. but possessively.")

			saynn("You feel their slow, exploring strokes along your neck, your thighs, your back.. They're clearly hungry for more contact.")

		else:
			saynn("The tentacles surround you in an instant, their tips glide over every part of you with a lusty touch.. curling, caressing, grasping.")

			saynn("They're dripping juices and pulsing with warm, slick tension..")

		if (_tentacles.lust <= 2):
			addButton("Rub", "Gently rub the tentacles", "0")
		addButton("Shoo!", "Tell the tentacles to stop", "say_shoo")
	if(state == "say_shoo"):
		saynn("You shoo the tentacle away from you.")

		saynn("You're not feeling frisky.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0"):
		saynn("You reach out and catch one of the slender tentacles.. It reflexively pulls back when it feels your hand.. but you calm it down with gentle touches.")

		saynn("[say=pc]Easy now.[/say]")

		saynn("As you slowly run your digits along its length, the tentacle goes very still and obedient. When that happens, you just keep rubbing it gently.. like you're petting it, feeling its strange vine-like texture. A soft, almost shivering ripple travels down its length in response.")

		saynn("You can feel it leaning ever so slightly into the pressure of your hand, a silent request for more.. but you think that it's enough for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		saynn("You catch one of the tentacles with your hands. It gives a startled little twitch, trying to slip free.")

		saynn("[say=pc]Easy. I'm not gonna hurt you.[/say]")

		saynn("You don't grip it very tightly.. you just let it rest against the palm of your hand while your digits are gently massaging it with slow circles over its smooth surface. You can feel the texture getting a bit slick under your touch.. and the tension melts away.")

		saynn("Feeling a bit more brave, you begin to stroke the tentacle along its length.. which makes the whole monster gently sway in response. Your hand is catching some kind of juice that the tentacle is secreting.. it lowers the friction greatly.")

		saynn("As you stop to ponder about it.. the tip of the tentacle curls back and nudges your hand. It clearly wants more.")

		saynn("And so you deliver, giving the tendril a few more long deliberate strokes, from the base to the tip.")

		saynn("[say=pc]That's enough for now.[/say]")

		saynn("You release it. The tentacle lingers for a moment, hovering near your hand. You gently push it away.. until the monster decides to move on.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		saynn("Your gaze settles on one of the more curious tentacles, its tip swaying gently near your shoulder.")

		saynn("You feel like you wanna do something with it.. And so you lean in and press your lips to its smooth, cool surface. You smooch it!")

		saynn("The tentacle freezes still, surprised. You hold the kiss for a moment longer.. a quiet, closed-mouth touch of your lips.. before pulling back.")

		saynn("A slow, deep shiver runs through the tendril's entire length, from the tip you just kissed all the way back to its hidden base.")

		saynn("The tentacle doesn't retreat.. instead, it gently pokes your neck, its tip leaving a little wet smooch of its own. It's being flirty, it's kinda cute.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "0"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "say_shoo"):
		_tentacles.trainNothing()

	setState(_action)
