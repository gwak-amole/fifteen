extends StaticBody2D

@export var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interaction_body_entered(body: Node2D) -> void:
	if body.name == "player":
		sprite.texture = load("res://assets/map/furniture/shelf_select.png")
		DialogueHandler.can_interact();
		DialogueHandler.last_name = name
		DialogueHandler.first_time_seeing_safe = false; 

func _on_interaction_body_exited(body: Node2D) -> void:
	if body.name == "player":
		sprite.texture = load("res://assets/map/furniture/shelf.png")
		DialogueHandler.cannot_interact();
		DialogueHandler.last_name = name
