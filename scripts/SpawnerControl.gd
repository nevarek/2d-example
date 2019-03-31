"""
SpawnerControl

Controls the spawning button and handles the spawning of a new object

TODO: do cool physics stuff
TODO: stop spawning on the buttons
"""

extends Control

const SpawnableObject = preload('res://scenes/SpawnedObject.tscn')

const GREEN = Color(0, 255, 0, 255)
const RED = Color(255, 0, 0, 255)

export (bool) var is_enabled = false

func _ready():
	# attach the built-in "pressed" signal emitted by $SpawnToggleButton, look in `self` for a function called `_on_SpawnToggleButton_pressed`
	$SpawnToggleButton.connect("pressed", self, "_on_SpawnToggleButton_pressed")

func _on_SpawnToggleButton_pressed():
	# a fancy way of writing: if true, then false else if false, then true
	is_enabled = !is_enabled
	print('Spawner toggle is set to %s' % is_enabled)

func _process(delta):
	# change color of button for user feedback
	if is_enabled:
		$SpawnToggleButton.self_modulate = GREEN
		_process_input()
	else:
		$SpawnToggleButton.self_modulate = RED
		

func _process_input():
	var spawn_position = Vector2()
	
	# in the Project ribbon menu tab, we set up a new action called "mouse_left"
	# Project > Project Settings > InputMap (tab)
	if Input.is_action_just_pressed('mouse_left'):
		spawn_position = get_global_mouse_position()
		spawn_godot(spawn_position)
		
func spawn_godot(spawn_position):
	# instance a spawnable object
	var newObject = SpawnableObject.instance()
	
	# set its position
	newObject.position = spawn_position
	
	# add it to the main scene tree, which happens to be the parent (in this case)
	get_parent().add_child(newObject)
	