extends Node

@onready var who_are_you: Button = $WhoAreYou
@onready var turn_it_off: Button = $TurnItOff
@onready var hello: Label = $"../Hello"

var ChoiceMade := 0

@onready var annoying_noise: Button = $"../Node2/AnnoyingNoise"
@onready var who_am_i: Button = $"../Node2/WhoAmI"
@onready var doctor_q: Button = $"../Node2/DoctorQ"
@onready var sorry: Button = $"../Node2/Sorry"

func _ready() -> void:
	annoying_noise.hide()
	who_am_i.hide()
	doctor_q.hide()
	sorry.hide()

func _on_turn_it_off_button_down() -> void:
	# for child in hello.get_children():
		# child.queue_free()
	ChoiceMade = 1
	hello.text = "You're so rude!" 
	wait(0.5)
	next_scene()

func _on_who_are_you_button_down() -> void:
	ChoiceMade = 2
	hello.text = "I'm the Doctor, heh!"
	wait(0.5)
	queue_free()

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	next_scene()

func next_scene():
	annoying_noise.show()
	who_am_i.show()
	doctor_q.show()
	sorry.show()
	if ChoiceMade == 1:
		who_am_i.hide()
		doctor_q.hide()
		wait(0.5)
		_on_annoying_noise_pressed() 
		_on_sorry_pressed()
	if ChoiceMade == 2:
		annoying_noise.hide()
		sorry.hide()
		wait(0.5)
		_on_doctor_q_pressed()
		_on_who_am_i_pressed()


func _on_annoying_noise_pressed() -> void:
	ChoiceMade = 11
	hello.text = "No, you!"
	annoying_noise.hide()
	sorry.hide()

func _on_doctor_q_pressed() -> void:
	ChoiceMade = 21
	hello.text = "You don't know what a doctor is?"
	who_am_i.hide()
	doctor_q.hide()


func _on_who_am_i_pressed() -> void:
	ChoiceMade = 22
	hello.text = "You don't know who you are?"
	who_am_i.hide()
	doctor_q.hide()


func _on_sorry_pressed() -> void:
	ChoiceMade = 12
	hello.text = "*sigh* I get it . . ."
	annoying_noise.hide()
	sorry.hide()
