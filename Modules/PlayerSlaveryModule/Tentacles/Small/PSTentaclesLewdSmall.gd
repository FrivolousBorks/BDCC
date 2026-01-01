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
	if(state == "3"):
		saynn("You're curious what the tentacles will do to you now.. so you present yourself for them.. completely naked. This is certainly unusual.. but you don't feel any fear.")

		saynn("The tentacles just watch you from a far at first.. but eventually one of them reaches out to brush against your side with a light touch. You don't pull away.. allowing it to do so. Soon, another joins in. Together, they begin a slow, curious exploration.")

		saynn("They trace the shape of your {pc.thick} waist, the curve of your {pc.masc} hip, gently mapping you out. One of the tentacles slides higher, brushing the underside of your {pc.breasts}, circling them with a soft, playful caress.")

		saynn("[say=pc]Mmhh..[/say]")

		saynn("The sensations make you moan ever so quietly. The tentacles pulse gently in response, probably feeling encouraged.")

		if (GM.pc.hasReachableVagina()):
			saynn("One slick tendril joins and dips lower, following the line of your stomach. It brushes, like a feather, over your pussy.. a teasing touch that makes your breath hitch. It doesn't press further, just rests there for a second, sending warmth throughout your whole body.")

		elif (GM.pc.hasReachablePenis()):
			saynn("One slick tendril joins and dips lower, coiling loosely around your thighs before sliding inward. It grazes, ever so softly, against your {pc.penis}.. a slow, casual stroke along your length that sends warmth throughout your whole body.")

		else:
			saynn("One slick tendril joins and dips lower, following the line of your stomach. It brushes, like a feather, over your crotch.. sliding further between your legs until it stumbles upon your {pc.analStretch} tailhole. It doesn't prod it, just leaving a teasing touch that makes your breath hitch.")

		saynn("[say=pc]Ah.. that should be enough for now.[/say]")

		saynn("After that fun little session, you notice that the rest of the tentacles get all slick and drippy..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4"):
		saynn("You're feeling a bit kinky and the monster can feel it.")

		saynn("A tentacle, one that's thin and more agile than the rest, reaches up beside you and finds your wrists. Before you can answer, it loops itself gently but firmly around one wrist.. and then the other, pulling them together behind your back.")

		saynn("Your chest is now pushed forward because of that.. no way to cover yourself.. The hold is secure.. but not fight enough to hurt. It feels nice.")

		saynn("[say=pc]Have you been practising?[/say]")

		saynn("Another slender tentacle reaches up towards your face and brushes against your cheek. It feels very alien.. but still.. The tentacle has a somewhat pleasant warm texture to it. The tendril pulls further, wrapping around the back of your head.. and then gliding over your eyes, blocking the light!")

		saynn("[say=pc]Ohh.. interesting.[/say]")

		saynn("That's not it. A third tentacle presses lightly against your lips. It doesn't force its way in.. just rests there.. a silent, leafy gag. You can still easily breathe through your nose.")

		saynn("Some more tentacles join and wrap themselves around your thighs, adding the final touch of restraining your legs, rendering you completely helpless in the end.")

		saynn("[say=pc]Mm-m..[/say]")

		saynn("You're just being held there.. immobilized by a tentacle monster, completely at its mercy. And it feels good. They don't pull or strain.. just simply hold, occasionally bringing your limbs together when you try to move them.")

		_tentacles.talk("We enjoyed it as well.")
		saynn("Eventually, they loosen up the grip, allowing you to become free again. You pull the green blindfold and gag off and watch as the monster sways happily.")

		saynn("You give the tentacles some pats.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5"):
		saynn("The tentacles surround you, their movement smooth and deliberate, gliding over your skin, sending little sparks of warmth all throughout you..")

		saynn("[say=pc]Feeling bold? Alright.. let's play.[/say]")

		saynn("You guide one of the tentacles and bring it up to your neck. It needs no further instruction.. carefully curling around, creating a loose but possessive loop.")

		saynn("After that, you just give it full control, raising your chin slightly and pulling your hands away.")

		saynn("Feeling that, the tentacles begin to slightly increase the pressure, now creating a second collar of sorts around your neck. A collar and a leash..")

		saynn("Seeing that you don't show any resistance, the tentacle continues to tighten up, now actually constraining your air intake.")

		saynn("Your breath hitches.. Another tendril supports the back of your head, holding you gently in place.")

		saynn("Your lips are parted as you're chasing the fading bits of air that you can still catch. Your vision starts to sparkle at the edges.. with a subtle wave of deep darkness fading in behind them.")

		saynn("[say=pc]Hh..[/say]")

		saynn("The tentacles feel your complete trust.. and put a little more pressure, closing your throat completely. All you can do is silently gasp for oxygen. The spots begin to dance more fiercely in your eyes, the whole cell starts becoming all rainbow-y.. At the same time, the all-consuming darkness creeps further, narrowing your vision to an extremely small circle.")

		if (GM.pc.hasReachableVagina()):
			saynn("Feels good.. Your pussy slit is wet from the extremely high levels of arousal..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Feels good.. Your cock is throbbing super hard from the extremely high levels of arousal..")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Feels good.. Your locked away cock is throbbing super hard in its cage from the extremely high levels of arousal.")

		saynn("Without even realizing it, you go limp.. completely helpless and airless.. suspended only by the tentacles' grip.")

		saynn("Only then is when the tentacles finally loosen the grip, making you produce a loud, ragged gasp!")

		saynn("[say=pc]Ah-h..[/say]")

		saynn("You start hungrily grabbing the air with your mouth. The vision slowly returns to you, your brain gradually recovering from the oxygen deprivation.")

		saynn("The tentacles gently set you down onto the floor.")

		_tentacles.talk("We hope that you have enjoyed this.")
		saynn("[say=pc]That was great.. hah..[/say]")

		saynn("You rub your neck.. that is now a bit bruised from all the choking. Still, worth it.")

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
