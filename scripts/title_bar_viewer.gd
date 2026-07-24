extends Panel

@export var window: TextureRect
var dragging := false
var drag_offset = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			
			if dragging:
				drag_offset = window.global_position - event.global_position
			
			accept_event()
	elif event is InputEventMouseMotion and dragging:
		window.global_position = event.global_position + drag_offset
		accept_event()
