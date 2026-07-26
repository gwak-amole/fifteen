extends Control

@export var click: AudioStreamPlayer
@export var bg: TextureRect
@export var text: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DialogueHandler.win:
		bg.texture = load("res://assets/screens/game_over_screen_win.png")
		if DialogueHandler.current_run > 1:
			text.text = "You won in " + str(DialogueHandler.current_run) + " runs."
		else:
			text.text = "You won without needing to rewind."
	else:
		bg.texture = load("res://assets/screens/game_over_screen.png")
		text.text = "game over."
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goback_pressed() -> void:
	click.play()
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
