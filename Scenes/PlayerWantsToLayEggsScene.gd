extends "res://Scenes/SceneBase.gd"

var eggsToLay:int = 0
var eggReport:String = ""

func _init():
	sceneID = "PlayerWantsToLayEggsScene"

#TODO: WRITE THIS SCENE

func _run():
	if(state == ""):
		playAnimation(StageScene.TFLook, "start")
		saynn("YOU WANT TO LAY EGGS..")
		
		addButton("Lay eggs", "See what happens..", "start_laying_eggs")
		addButton("Clench", "Try to hold them in!", "do_clench")
	
	if(state == "no_stamina_must_lay"):
		saynn("YOU TRY TO CLENCH BUT YOU DON'T HAVE THE STRENGTH..")
		addButton("Lay eggs", "See what happens..", "start_laying_eggs")
	
	if(state == "start_laying_eggs"):
		playAnimation(StageScene.EggLaying, str(eggsToLay), {bodyState={naked=true}})
		
		saynn("YOU BEGIN LAYING "+str(eggsToLay)+" EGGS!")
		
		addButton("Continue", "See what happens next", "doLay")
	
	if(state == "doLay"):
		playAnimation(StageScene.EggLaying, "idle", {bodyState={naked=true}})
		
		saynn("YOU LAYED "+str(eggsToLay)+" EGGS!")
		
		saynn("REPORT:\n"+eggReport)
		
		addButton("Continue", "Time to go..", "endthescene")
	
	if(state == "after_clenching"):
		playAnimation(StageScene.TFLook, "crotch")
		
		saynn("YOU CLENCH BUT IT USES A LOT OF STAMINA!")
		addButton("Continue", "Time to go..", "endthescene")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "do_clench"):
		if(GM.pc.getStamina() <= 0):
			setState("no_stamina_must_lay")
		else:
			GM.pc.addStamina(-30)
			setState("after_clenching")
			var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
			if(menstrualCycle):
				menstrualCycle.delayEggs()
		return
		
	if(_action == "start_laying_eggs"):
		var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
		if(menstrualCycle):
			eggsToLay = menstrualCycle.getAmountOfEggsReadyToBeLaid()
	
	if(_action == "doLay"):
		var menstrualCycle:MenstrualCycle = GM.pc.getMenstrualCycle()
		if(menstrualCycle):
			var theEggs:Array = menstrualCycle.layEggs()
			eggReport = menstrualCycle.generateLayEggsReport(theEggs)
		processTime(10*60)
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["eggsToLay"] = eggsToLay
	data["eggReport"] = eggReport

	return data
	
func loadData(data):
	.loadData(data)
	
	eggsToLay = SAVE.loadVar(data, "eggsToLay", 0)
	eggReport = SAVE.loadVar(data, "eggReport", "")
