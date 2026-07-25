extends StaticBody2D

@export var sprite: Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if sprite.texture == load("res://assets/map/furniture/lamp.png"):
			sprite.texture = load("res://assets/map/furniture/lamp_on_selected.png")
		elif sprite.texture == load("res://assets/map/furniture/lamp_off.png"):
			sprite.texture = load("res://assets/map/furniture/lamp_off_selected.png")
		body.set_physics_process(false)
		DialogueHandler.can_interact();
		DialogueHandler.last_name = "lamp"
		body.set_physics_process(true)
		

func _on_interact_body_exited(body: Node2D) -> void:
	if body.name == "player":
		if sprite.texture == load("res://assets/map/furniture/lamp_on_selected.png"):
			sprite.texture = load("res://assets/map/furniture/lamp.png")
		elif sprite.texture == load("res://assets/map/furniture/lamp_off_selected.png"):
			sprite.texture = load("res://assets/map/furniture/lamp_off.png")
		DialogueHandler.cannot_interact();
		DialogueHandler.last_name = name
