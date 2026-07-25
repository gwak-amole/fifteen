extends CanvasLayer

@export var close_up: TextureRect
var resource = load("res://dialogues/drawer_interaction.dialogue")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_up.hide();
	DialogueHandler.connect("showing_shipping_tag", show_tag)
	DialogueHandler.connect("hiding_shipping_tag", hide_tag)


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

func show_tag():
	close_up.show();
	
func hide_tag():
	close_up.hide();
