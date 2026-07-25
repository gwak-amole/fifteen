extends StaticBody2D

@export var sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interaction_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if name.contains("1"):
			sprite.texture = load("res://assets/map/furniture/beanbag1_selected.png")
		elif name.contains("2"):
			sprite.texture = load("res://assets/map/furniture/beanbag2_selected.png")
		DialogueHandler.can_interact();
		DialogueHandler.last_name = "beanbag"

func _on_interaction_body_exited(body: Node2D) -> void:
	if body.name == "player":
		if name.contains("1"):
			sprite.texture = load("res://assets/map/furniture/beanbag1.png")
		elif name.contains("2"):
			sprite.texture = load("res://assets/map/furniture/beanbag2.png")
		DialogueHandler.cannot_interact();
		DialogueHandler.last_name = "beanbag"
