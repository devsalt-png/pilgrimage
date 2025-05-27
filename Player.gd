extends CharacterBody2D

var speed = 400  # speed in pixels/sec

@onready var talk_to: Label = %TalkTo
@onready var test_dialogue: Label = %TestDialogue

var AreaEntered: bool

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * speed

	move_and_slide()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	AreaEntered = true
	%TalkTo.visible = true 
	if %TalkTo.visible == true:
		%TalkTo.text = ("Talk to the Doctor")
	else:
		%TalkTo.visible = false 

func _on_area_2d_body_exited(_body: Node2D) -> void:
	AreaEntered = false
	%TalkTo.visible = false 
