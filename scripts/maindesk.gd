extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if !body.pushing:
			var resource = load("res://dialogues/computer_interaction.dialogue")
			DialogueManager.show_dialogue_balloon(resource, "start")
		else:
			$Area2D.monitoring = false
			await get_tree().process_frame
			$Area2D.monitoring = true;
