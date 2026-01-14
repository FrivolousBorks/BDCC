extends SexActivityBase

var currentPose:String = ""

const POSE_ALLHOLES = "allholes"
const POSE_CUDDLEFUCK = "cuddlefuck"
const POSE_BONDAGEFUCK = "bondagefuck"
const POSE_CHOKEFUCK = "chokefuck"

#TODO: Switch/start text
const POSES = {
	POSE_ALLHOLES: {
		name = "All holes",
		anim = StageScene.TentaclesSex,
		anims = ["tease", "inside", "sex", "fast"],
		isAllHoles = true,
	},
	POSE_CUDDLEFUCK: {
		name = "Cuddle-fuck",
		anim = StageScene.TentaclesCuddle,
		anims = ["tease", "inside", "sex", "fast"],
	},
	POSE_BONDAGEFUCK: {
		name = "Bound-fuck",
		anim = StageScene.TentaclesBondage,
		anims = ["tease", "inside", "sex", "fast"],
	},
	POSE_CHOKEFUCK: {
		name = "Choke-fuck",
		anim = StageScene.TentaclesChoke,
		anims = ["sextease", "sexinside", "sex", "sexfast"],
	},
}

func getAvaiablePoses() -> Array:
	if(currentPose == POSE_CHOKEFUCK):
		return [POSE_CHOKEFUCK]
	
	return [POSE_ALLHOLES, POSE_CUDDLEFUCK, POSE_BONDAGEFUCK]

func _init():
	id = "TentaclesSexAllHoles"
	
	activityName = "All holes"
	activityDesc = "Fuck the sub's pussy, ass and mouth."
	activityCategory = ["Fuck"]


func getGoals():
	return {
		SexGoal.FuckVaginal: 1.0,
		SexGoal.FuckAnal: 1.0,
		SexGoal.FuckOral: 1.0,
	}

func getSupportedSexTypes():
	return {
		SexType.TentaclesSex: true,
	}

func isActivityImpossibleShouldStop() -> bool:
	#if(!getSub().hasReachableVagina() || !getSub().hasReachableAnus() || getSub().isOralBlocked()):
	#	return true
	return false

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	var sub:BaseCharacter = _subInfo.getChar()
	#if(!sub.hasReachableVagina()):
	#	return false
	if(!sub.hasReachableAnus()):
		return false
	if(sub.isOralBlocked()):
		return false
	
	#var dom:BaseCharacter = _domInfo.getChar()
	#if(!dom.hasReachablePenis() && !dom.isWearingStrapon()):
	#	return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed, SexActivityTag.PenisInside]
		return [SexActivityTag.HavingSex, SexActivityTag.PenisUsed]
	if(_indx == SUB_0):
		if(state != ""):
			return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.AnusPenetrated, SexActivityTag.VaginaUsed, SexActivityTag.VaginaPenetrated, SexActivityTag.MouthUsed]
		return [SexActivityTag.HavingSex, SexActivityTag.AnusUsed, SexActivityTag.VaginaUsed]
	return []

func startActivity(_args):
	currentPose = RNG.pick(getAvaiablePoses())
	
	addText("{dom.You} grab {sub.you} and prepare for sex, {dom.yourHis} tentacles are pressed against all {sub.yourHis} holes at once!")

func onSwitchFrom(_otherActivity, _args):
	pass

func processTurn():
	return

func inside_processTurn():
	cockWarmer(SUB_0, DOM_0, S_VAGINA)
	cockWarmer(SUB_0, DOM_0, S_ANUS)

func sex_processTurn():
	stimulateSex(DOM_0, SUB_0, S_VAGINA, I_NORMAL, SPEED_SLOW)
	stimulateSex(DOM_0, SUB_0, S_ANUS, I_NORMAL, SPEED_SLOW)
	stimulateSex(DOM_0, SUB_0, S_MOUTH, I_NORMAL, SPEED_SLOW)
	
	doProcessFuck(DOM_0, SUB_0, S_VAGINA, " during a whole-blown gangbang")
	doProcessFuck(DOM_0, SUB_0, S_ANUS)
	doProcessFuck(DOM_0, SUB_0, S_MOUTH)
	
	doProcessFuckExtra(DOM_0, SUB_0, S_VAGINA)
	doProcessFuckExtra(DOM_0, SUB_0, S_ANUS)

#TODO: Fix the getPauseSexScore and getContinueSexScore here?

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("stop", getStopScore(), "Stop sex", "Stop the sex")
		
		if(state == "inside" && !checkActiveDomPC(_indx)):
			addAction("fuckMore", getContinueSexScore(_indx, SUB_0, S_ANUS)-getStopScore(), "Continue fucking", "Start fucking them again")
			addAction("pullOut", getStopScore(), "Pull out", "Pull your member out")
		
		if(state == ""):
			addAction("rub", 1.0 if !isReadyToPenetrate(_indx) else 0.4, "Rub", "Rub your cock against them", {A_PRIORITY: 4})
			if(hasBodypartUncovered(SUB_0, S_VAGINA) && hasBodypartUncovered(SUB_0, S_ANUS) && !getSub().isOralBlocked() && !checkActiveDomPC(_indx)):
				addAction("penetrate", 1.0, "Penetrate", "Try to start fucking them!", {A_PRIORITY: 5})
		if(state == "sex" && !checkActiveDomPC(_indx)):
			addAction("pause", getPauseSexScore(_indx, SUB_0, S_ANUS), "Slow down", "Pause the fucking", {A_PRIORITY: 1})
		
		if(state == "sex" && isReadyToCumHandled(DOM_0)):
			addAction("cum", 1.0, "Cum inside", "Cum inside them!", {A_PRIORITY: 1001})
		elif(state == "sex" && isReadyToCumHandled(SUB_0) && !canDoActions(SUB_0) && !checkActiveDomPC(_indx)):
			addAction("subcum", 1.0, "Sub orgasm!", "They are about to cum!", {A_PRIORITY: 1001})
		
		for pose in getAvaiablePoses():
			if(pose == currentPose):
				continue
			if(!POSES.has(pose)):
				continue
			var poseName:String = POSES[pose]["name"]
			addAction("switchpose", 0.0, poseName, "Change pose", {A_CATEGORY: ["Switch pose"], A_ARGS: [pose]})
		
		
	if(_indx == SUB_0):
		addAction("pullaway", getSubInfo().getResistScore(), "Pull away", "Try to pull away", {A_CHANCE: getSubResistChance(30.0, 25.0), A_PRIORITY: 2})
		if(state == "sex"):
			if(isReadyToCumHandled(SUB_0)):
				addAction("subcum", 1.0, "Cum!", "You're about to cum!", {A_PRIORITY: 1001})

func doAction(_indx:int, _id:String, _action:Dictionary):
	if(_id == "cum"):
		stimulate(DOM_0, S_PENIS, SUB_0, S_VAGINA, I_NORMAL, Fetish.VaginalSexGiving)
		stimulate(DOM_0, S_PENIS, SUB_0, S_ANUS, I_NORMAL, Fetish.AnalSexGiving)
		var orgAmount:int = 0
		if(isReadyToCumHandled(DOM_0)):
			orgAmount += 1
		if(isReadyToCumHandled(SUB_0)):
			orgAmount += 1
			
		if(orgAmount == 2):
			addText("[b]Double orgasm![/b]")
		elif(orgAmount == 3):
			addText("[b]Triple orgasm![/b]")
		elif(orgAmount == 4):
			addText("[b]Quadruple orgasm![/b]")
		if(isReadyToCumHandled(SUB_0)):
			cumGeneric(SUB_0, DOM_0)
		if(isReadyToCumHandled(DOM_0)):
			getDom().fillBalls(1.0)
			cumInside(DOM_0, SUB_0, S_VAGINA)
			getDom().fillBalls(1.0)
			cumInside(DOM_0, SUB_0, S_ANUS)
			getDom().fillBalls(1.0)
			cumInside(DOM_0, SUB_0, S_MOUTH)
		satisfyGoals()
		state = "inside"
		return
	if(_id == "fuckMore"):
		addText("The doms start fucking {sub.you} again!")
		state = "sex"
		return
	if(_id == "pause"):
		addTextTopBottom("{<TOP>.You} {<TOP>.youVerb('pause')} the gangbang.", _indx, SUB_0)
		state = "inside"
		return
	if(_id == "pullOut"):
		addText("{dom.You} {dom.youVerb('pull')} {dom.yourHis} tentacles out.")
		state = ""
		return
	if(_id == "rub"):
		addText("{dom.You} {dom.youVerb('rub')} {dom.yourHis} tentacles against {sub.your} holes.")
		stimulateSex(DOM_0, SUB_0, S_VAGINA, I_TEASE)
		stimulateSex(DOM_0, SUB_0, S_ANUS, I_TEASE)
		stimulateSex(DOM_0, SUB_0, S_MOUTH, I_TEASE)
		return
	if(_id == "penetrate"):
		if(tryPenetrate(DOM_0, SUB_0, S_VAGINA)):
			penetration(true, DOM_0, SUB_0, S_ANUS)
			addText("{dom.You} {dom.youVerb('force')} {dom.yourHis} {dom.penisShort} down {sub.yourHis} ass.")
			addText("{dom.You} {dom.youVerb('follow')}, forcing {dom.yourHis} {dom.penisShort} down {sub.yourHis} throat.")
			state = "sex"
		else:
			penetration(false, DOM_0, SUB_0, S_ANUS)
			addText("{dom.You} {dom.youVerb('try', 'tries')} to stretch {sub.yourHis} ass with {dom.yourHis} {dom.penisShort}.")
		return
	if(_id == "stop"):
		endActivity()
		addText("{dom.You} {dom.youVerb('pull')} away from {sub.you}.")
		return 
	if(_id == "domcumstrapon"):
		cumGeneric(_indx, _indx)
		return
	if(_id == "switchpose"):
		#switchedPoseOnce = true
		var newPose:String = _action["args"][0]
		#var isInside:bool = true
		#if(state in [""]):
		#	isInside = false
		
		#if(isInside):
		#	addText(getSwitchPoseTextForPose(newPose))
		#else:
		#	addText(getStartTextForPose(newPose))
		addText("{dom.You} {dom.youVerb('switch', 'switches')} pose!")
		currentPose = newPose
		return

	if(_id == "pullaway"):
		var successChance:float = getSubResistChance(30.0, 25.0)
		if(RNG.chance(successChance)):
			addText("{sub.You} {sub.youVerb('pull')} away from {dom.you}.")
			getDomInfo().addAnger(0.3)
			if(getState() != ""):
				setState("")
			else:
				endActivity()
			return
		else:
			addText("{sub.You} {sub.youVerb('try', 'tries')} to pull away from {dom.you} but {sub.youVerb('fail')}.")
			getDomInfo().addAnger(0.1)
			return
	if(_id == "subcum"):
		cumGeneric(SUB_0, DOM_0)
		return
			
func getSubResistChance(baseChance:float, domAngerRemoval:float) -> float:
	var theChance = baseChance - getDomInfo().getAngerScore()*domAngerRemoval
	if(getSub().hasBlockedHands()):
		theChance *= 0.5
	if(getSub().hasBoundArms()):
		theChance *= 0.5
	if(getSub().isBlindfolded()):
		theChance *= 0.8
	
	return max(theChance, 5.0)

func getAnimation():
	var theSexAnim:String = StageScene.TentaclesSex
	var theSexAnims:Array = ["tease", "inside", "sex", "fast"]
	if(POSES.has(currentPose)):
		var thePose:Dictionary = POSES[currentPose]
		theSexAnim = thePose.get("anim", theSexAnim)
		theSexAnims = thePose.get("anims", theSexAnims)
	
	if(state == "inside"):
		return [theSexAnim, theSexAnims[1], {pc=SUB_0}]
	if(state == "sex"):
		if(isCloseToCumming(DOM_0)):
			return [theSexAnim, theSexAnims[3], {pc=SUB_0}]
		return [theSexAnim, theSexAnims[2], {pc=SUB_0}]
	return [theSexAnim, theSexAnims[0], {pc=SUB_0}]
	#return [StageScene.Duo, "stand", {pc=SUB_0, npc=DOM_0, npcAction="stand"}]

func getAnimationPriority():
	return 10

func getOrgasmHandlePriority(_indx:int) -> int:
	return 10

func saveData():
	var data = .saveData()
	
	data["currentPose"] = currentPose

	return data
	
func loadData(data):
	.loadData(data)
	
	currentPose = SAVE.loadVar(data, "currentPose", "")
	if(currentPose == ""):
		currentPose = RNG.pick(getAvaiablePoses())
