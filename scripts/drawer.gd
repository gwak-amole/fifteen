extends CanvasLayer

@export var close_up: TextureRect
@export var shipping_tag: TextureButton
@export var click: AudioStreamPlayer
var resource = load("res://dialogues/drawer_interaction.dialogue")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_up.hide();
	DialogueHandler.connect("showing_shipping_tag", show_tag)
	DialogueHandler.connect("hiding_shipping_tag", hide_tag)
	DialogueHandler.connect("update_evidence", took_tag)
	DialogueHandler.connect("rewind", rewind_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_suntzu_pressed() -> void:
	click.play()
	DialogueManager.show_dialogue_balloon(resource, "suntzu")


func _on_blush_pressed() -> void:
	click.play()
	DialogueManager.show_dialogue_balloon(resource, "blush")


func _on_shipping_tag_pressed() -> void:
	click.play()
	DialogueManager.show_dialogue_balloon(resource, "shipping_tag")


func _on_done_pressed() -> void:
	click.play()
	hide();

func show_tag():
	close_up.show();
	
func hide_tag():
	close_up.hide();

func took_tag(arg: String):
	if arg == "tag":
		shipping_tag.hide()

func rewind_game():
	close_up.hide()
	shipping_tag.show()
