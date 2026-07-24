extends Node

signal checking_lamp
signal trying_password

var saw_lamp_password = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	saw_lamp_password = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_lamp():
	checking_lamp.emit()

func try_password():
	trying_password.emit()
