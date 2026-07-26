extends Control

@export var anim: AnimationPlayer
@export var click: AudioStreamPlayer
@export var credits: Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	credits.hide()
	anim.play("start_screen_movement")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	click.play()
	DialogueHandler.reset()
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_howto_pressed() -> void:
	click.play()
	credits.show()


func _on_texture_button_pressed() -> void:
	credits.hide()
