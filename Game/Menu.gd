
extends Control

# member variables here, example:
var used_keys = []
var size = 26

var global

func _ready():
	set_process_input(true)
	global = get_node("/root/global")
	
	var i = 65
	while i <= 90:
		used_keys.append(i)
		i += 1
	
	if(global.number_boss_defeated == 0):
		set_keys("Player1")
		set_keys("Player2")
		set_keys("Player3")
	
	if(global.number_boss_defeated == 1):
		get_node("AnimationPlayer").play("trans1")
	elif(global.number_boss_defeated == 2):
		get_node("AnimationPlayer").play("trans2")
	set_labels_inputs()
	
	get_node("MusicPlayer").play("Chaos Title")

func _input(event):
	if(event.type == InputEvent.KEY and event.is_pressed() == true ):
		if event.scancode == 32:
			global.global_timer = (600 - (global.number_boss_defeated * 60))
			global.goto_scene("res://Game/Stage 1.scn")

func set_keys(name):
	get_node(name).key_movements["up"] = remove_used_key()
	get_node(name).key_movements["down"] = remove_used_key()
	get_node(name).key_movements["left"] = remove_used_key()
	get_node(name).key_movements["right"] = remove_used_key()
	global.players_keys[name] = {}
	global.players_keys[name]["up"] = get_node(name).key_movements["up"]
	global.players_keys[name]["down"] = get_node(name).key_movements["down"]
	global.players_keys[name]["left"] = get_node(name).key_movements["left"]
	global.players_keys[name]["right"] = get_node(name).key_movements["right"]
	
func remove_used_key():
	randomize();
	var ind = randi() % size
	size -= 1
	var value = used_keys[ind]
	used_keys[ind] = used_keys[size]
	return value

func set_labels_inputs():
	get_node("Left1").set_text(OS.get_scancode_string(get_node("Player1").key_movements["left"]))
	get_node("Right1").set_text(OS.get_scancode_string(get_node("Player1").key_movements["right"]))
	get_node("Left2").set_text(OS.get_scancode_string(get_node("Player2").key_movements["left"]))
	get_node("Right2").set_text(OS.get_scancode_string(get_node("Player2").key_movements["right"]))
	get_node("Left3").set_text(OS.get_scancode_string(get_node("Player3").key_movements["left"]))
	get_node("Right3").set_text(OS.get_scancode_string(get_node("Player3").key_movements["right"]))
	get_node("Up1").set_text(OS.get_scancode_string(get_node("Player1").key_movements["up"]))
	get_node("Down1").set_text(OS.get_scancode_string(get_node("Player1").key_movements["down"]))
	get_node("Up2").set_text(OS.get_scancode_string(get_node("Player2").key_movements["up"]))
	get_node("Down2").set_text(OS.get_scancode_string(get_node("Player2").key_movements["down"]))	
	get_node("Up3").set_text(OS.get_scancode_string(get_node("Player3").key_movements["up"]))
	get_node("Down3").set_text(OS.get_scancode_string(get_node("Player3").key_movements["down"]))