extends Node

var players_life = 20
var Actors = {}

var current_scene = null

func _ready():
	#Initalizer
	Actors["Enemy1"] = load("res://Game/Enemy1.scn")
	Actors["Bullet"] = load("res://Game/Bullet.scn")
	Actors["Wall"] = load("res://Game/Wall.scn")
	Actors["Player"] = load("res://Game/Player.scn")
	Actors["Turret"] = load("res://Game/Turret.scn")
	Actors["Spawner"] = load("res://Game/Spawner.scn")
	Actors["Hole"] = load("res://Game/Hole.scn")
	Actors["Door"] = load("res://Game/Door.scn")
	
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	pass

func initalize_stage():
	players_life = 20
	
func goto_scene(path):
	call_deferred("_deferred_goto_scene",path)
	
func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)