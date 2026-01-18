extends StatusEffectBase

func _init():
	id = StatusEffect.EggStuffed
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 89
	
func shouldApplyTo(_npc):
	if(_npc.isVisiblyEggStuffed()):
		return true
	return false

func getEffectName():
	return "Egg-Stuffed"

func getEffectDesc():
	var theMenstrualCycle:MenstrualCycle = character.getMenstrualCycle()
	if(!theMenstrualCycle):
		return "You are stuffed with eggs.."
	
	var theTimeUntilEggs:int = theMenstrualCycle.getTimeUntilNextEggLaying()
	var eggAm:int = theMenstrualCycle.bigEggs.size()
	
	return "You are stuffed with "+str(eggAm)+" egg"+("s" if eggAm != 1 else "")+".. "+Util.getTimeStringHumanReadable(theTimeUntilEggs)+" left until you will want to lay "+("them." if eggAm != 1 else "it.")

func getEffectImage():
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [] #TODO: Debuffs for having many eggs in you?
