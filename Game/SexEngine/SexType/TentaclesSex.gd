extends SexTypeBase

func _init():
	id = SexType.TentaclesSex

func processArgs(_args:Dictionary):
	_args[SexMod.DomsStartNaked] = true
	_args[SexMod.DisableDynamicJoiners] = true
	_args[SexMod.DisableDomTalking] = true

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var theDomIDs:Array = sexEngine.getXFreeDomIDsForAnim(1)
	var theSubIDs:Array = sexEngine.getXFreeSubIDsForAnim(1)
	
	if(theSubIDs.empty() && theDomIDs.empty()):
		return null
	
	if(theSubIDs.empty()):
		return [StageScene.TentaclesDuo, "stand", {onlyTentacles=true}]
	if(theDomIDs.empty()):
		if(isUnconscious(theSubIDs[0])):
			return [StageScene.Sleeping, "sleep", {pc=theSubIDs[0]}]
		return [StageScene.GivingBirth, "idle", {pc=theSubIDs[0]}]

	if(isUnconscious(theSubIDs[0])):
		return [StageScene.TentaclesSleepOn, "sleep", {pc=theSubIDs[0]}]
	return [StageScene.TentaclesTease, "tease", {pc=theSubIDs[0]}]
