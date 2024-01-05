extends CharacterBody2D

@onready var lilguy = $Guy
@onready var smashshield = $smashshield
@export var facing := 1 #right
@export var speed = 300
@export var attacking = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var input_direction: float = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed


func move():
	if Input.is_action_pressed("ui_NeutralAttack"):
		lilguy.play("bite")
		attacking = true
		if lilguy.frame == 3:
			velocity.x = facing * 180
		else:
			velocity.x = 0
		

	elif Input.is_action_pressed("ui_right"):
		if facing == -1:
			lilguy.flip_h = false
		lilguy.play("walk right")
		facing = 1
	
	elif Input.is_action_pressed("ui_left"):
		if facing == 1:
			lilguy.flip_h = true
		lilguy.play("walk right")
		facing = -1
	
	elif Input.is_action_pressed("ui_down"):
		lilguy.play("squat right")

	elif Input.is_action_pressed("ui_up"):
		lilguy.play("look up right")
	
	else:
		lilguy.play("default right")
	
	if not Input.is_action_pressed("ui_NeutralAttack"):
		attacking = false

func attack():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	move()

func _physics_process(_delta):
	if not attacking:
		get_input()
	if not smashshield.draw():
		move_and_slide()
	


