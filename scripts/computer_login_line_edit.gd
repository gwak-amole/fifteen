extends LineEdit

var has_words = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	focus_entered.connect(on_focus)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_focus():
	placeholder_text = "";
