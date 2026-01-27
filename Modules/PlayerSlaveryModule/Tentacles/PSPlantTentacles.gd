extends Character

func _init():
	id = "psplantTentacles"
	disableSerialization = true
	
func _getName():
	if(GM.main != null):
		if(GM.main.PS && GM.main.PS.id == "Tentacles"):
		 return GM.main.PS.id
	return "Plant Tentacles"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A tentacle monster made out of multiple slick green tendrils.."

func getSpecies():
	return ["unknown"]

#func getPenisSize():
#	return 20.0

func getCustomFluidType(_fluidSource) -> String:
	return "IvyNectar"

#func getFluidAmount(_fluidSource):
#	return RNG.randf_range(350.0, 750.0)

func getBaseFertility() -> float:
	return 0.0

# Can't get pregnant from it
func getBaseVirility() -> float:
	return 0.0

func createBodyparts():
	var penis = GlobalRegistry.createBodypart("humanpenis")
	penis.lengthCM = 25
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
