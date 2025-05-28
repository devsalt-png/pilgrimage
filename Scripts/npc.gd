extends RigidBody2D

@onready var interactable_item: Area2D = $InteractableItem

func _ready() -> void:
	interactable_item.interact = _on_interact

func _on_interact():
	interactable_item.CanInteract = false
	
