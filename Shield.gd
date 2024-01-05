extends CharacterBody2D


@onready var shield = $Shield

func draw():
	if Input.is_action_pressed("ui_LT"):
		shield.play("on")
		return true
	else:
		shield.play("off")
		return false

func _process(_delta):
	draw()
