extends Spatial

var isPlant = false

onready var animation_player = $AnimationPlayer
onready var animation_player3 = $TentaclesAnims3/AnimationPlayer

func setPlant():
	if(isPlant):
		return
	
	$TentaclesArmature/Skeleton/Tentacle.set_surface_material(0, preload("res://Player/Props/PlantTentacles.tres"))
	$DirectionalLight.visible = true
	$DirectionalLight2.visible = true
	
	isPlant = true

func setLatex():
	if(!isPlant):
		return
	
	$TentaclesArmature/Skeleton/Tentacle.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	$DirectionalLight.visible = false
	$DirectionalLight2.visible = false
	
	isPlant = false
