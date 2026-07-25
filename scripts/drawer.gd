extends CanvasLayer

var resource = load("res://dialogues/drawer_interaction.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_suntzu_pressed() -> void:
	DialogueManager.show_dialogue_balloon(resource, "suntzu")


func _on_blush_pressed() -> void:
	DialogueManager.show_dialogue_balloon(resource, "blush")


func _on_shipping_tag_pressed() -> void:
	DialogueManager.show_dialogue_balloon(resource, "shipping_tag")


func _on_done_pressed() -> void:
	hide();
