extends Control

@export var anim: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("start_screen_movement")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
