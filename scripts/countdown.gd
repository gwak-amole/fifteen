extends CanvasLayer

@export var time_label: Label
@export var run_label: Label
@export var evidence_label: Label
@export var tag_icon: TextureRect
@export var txt_icon: TextureRect
@export var receipt_icon: TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tag_icon.hide()
	txt_icon.hide()
	receipt_icon.hide()	
	DialogueHandler.connect("update_time", update_the_time)
	DialogueHandler.connect("update_run", update_the_run_label)
	DialogueHandler.connect("update_evidence", update_evidence_label)
	
	update_the_run_label()
	update_evidence_label("")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_the_time():
	time_label.text = str(int(DialogueHandler.time_remaining))

func update_the_run_label():
	run_label.text = "Run: " + str(DialogueHandler.current_run) + "/3"

func update_evidence_label(arg: String):
	evidence_label.text = "Evidence (" + str(DialogueHandler.evidence_found) + "/3):"
	if arg == "tag":
		tag_icon.show();
	elif arg == "txt":
		txt_icon.show();
	elif arg == "receipt":
		receipt_icon.show()
	elif arg == "reset":
		tag_icon.hide()
		txt_icon.hide()
		receipt_icon.hide()
