extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_interact_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.set_physics_process(false)
		var resource = load("res://dialogues/lamp_interaction.dialogue")
		DialogueManager.show_dialogue_balloon(resource, "start")
		await DialogueManager.dialogue_ended
		body.set_physics_process(true)
