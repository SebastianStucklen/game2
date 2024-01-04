extends CharacterBody2D

@onready var lilguy = $AnimatedSprite2D
@export var facing := 0 #right
@export var speed = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var input_direction: float = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()


func draw():
	if Input.is_action_pressed("ui_right"):
		lilguy.play("walk right")
		facing = 0
	
	elif Input.is_action_pressed("ui_left"):
		lilguy.play("walk left")
		facing = 1
	
	elif Input.is_action_pressed("ui_down"):
		if facing == 0:
			lilguy.play("squat right")
		if facing == 1:
			lilguy.play("squat left")

	elif Input.is_action_pressed("ui_up"):
		if facing == 0:
			lilguy.play("look up right")
		if facing == 1:
			lilguy.play("look up left")
	
	else:
		if facing == 0:
			lilguy.play("default right")
		if facing == 1:
			lilguy.play("default left")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	draw()

