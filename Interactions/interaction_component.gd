extends Node2D

@onready var interact_label: Label = $InteractLabel
var CurrentInteractions := []
var CanInteract := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and CanInteract:
		if CurrentInteractions:
			CanInteract = false
			Dialogic.start("Doc")
			
			await CurrentInteractions[0].interact.call()
			
			CanInteract = true

func _process(_delta: float) -> void:
	if CurrentInteractions and CanInteract:
		CurrentInteractions.sort_custom(_sort_by_nearest)
		if CurrentInteractions[0].CanInteract:
			interact_label.text = CurrentInteractions[0].InteractName
			interact_label.show()
	else:
		interact_label.hide()

func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist

func _on_interact_range_area_entered(area: Area2D) -> void:
	CurrentInteractions.push_back(area)

func _on_interact_range_area_exited(area: Area2D) -> void:
	CurrentInteractions.erase(area)
