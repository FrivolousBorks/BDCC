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

	return "You are stuffed with "+str(theMenstrualCycle.bigEggs.size())+" eggs.. "

func getEffectImage():
	return "res://Images/StatusEffects/mother.png"

func getIconColor():
	return IconColorDarkPurple

func getBuffs():
	return [] #TODO: Debuffs for having many eggs in you?
