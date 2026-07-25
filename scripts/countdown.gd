extends CanvasLayer

@export var time_label: Label
@export var run_label: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello?")
	DialogueHandler.connect("update_time", update_the_time)
	DialogueHandler.connect("update_run", update_the_run_label)
	
	update_the_run_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_the_time():
	time_label.text = str(int(DialogueHandler.time_remaining))

func update_the_run_label():
	run_label.text = "Run: " + str(DialogueHandler.current_run)
