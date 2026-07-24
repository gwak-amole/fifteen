extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interaction_body_entered(body: Node2D) -> void:
	if body.name == "player":
		DialogueHandler.can_interact();
		DialogueHandler.last_name = name

func _on_interaction_body_exited(body: Node2D) -> void:
	if body.name == "player":
		DialogueHandler.cannot_interact();
		DialogueHandler.last_name = name
