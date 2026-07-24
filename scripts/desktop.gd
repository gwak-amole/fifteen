extends CanvasLayer

@export var taxes_window: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	taxes_window.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_taxes_pressed() -> void:
	taxes_window.show();
