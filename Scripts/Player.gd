extends CharacterBody2D

var speed = 200  # speed in pixels/sec

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed
	if Input.is_action_pressed("Sprint"):
		speed = 400
	else:
		speed = 200

	move_and_slide()
