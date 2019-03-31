extends Node2D

func _ready():
	# connect built-in `timeout` signal from the timer to callback
	$Timer.connect("timeout", self, "on_timeout")
	
	$Timer.one_shot = true # run once
	$Timer.wait_time = 0.5
	
	$Timer.start()

func on_timeout():
	# despawn self
	queue_free()