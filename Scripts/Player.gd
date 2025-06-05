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

func attack():
	if Input.is_action_just_pressed("Click"):
		CombatSingleton.PlayerDMG += CombatSingleton.PlayerDMG / CombatSingleton.BossDEF
		CombatSingleton.BossHealth -= CombatSingleton.PlayerDMG
		print("HITT")

func _ready() -> void:
	print("MAMA")
	print(CombatSingleton.BossHealth)
	print(CombatSingleton.PlayerDMG)
