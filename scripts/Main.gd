"""
Main script

TODO: find a way to not have to call update_label() on every button callback. There is a way to update the label once per frame automatically.
"""

extends Node2D

# Declare member variables here
# export means we can see and edit this variable through the editor, we can also specify its type
export (int) var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# set the count on the label at the start
	# For this example, the actual initial value is changes through the editor, so it is not 0 as expected when it starts
	_update_label()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _update_label():
	# remember count is an integer, so we typecast it
	# $ is shorthand for referencing this node's children by name
	$CounterControl/CountLabel.text = str(count)

# Signals from the buttons are attached through the editor, although there is a way to do it programatically, too.
# Callback for when IncreaseButton is pressed
func _on_IncreaseButton_pressed():
	count += 1
	_update_label()

# Callback for when DecreaseButton is pressed
func _on_DecreaseButton_pressed():
	count -= 1
	
	# set minimum to zero for funzies
	if count < 0:
		count = 0
	_update_label()
	