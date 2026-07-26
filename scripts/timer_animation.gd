extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueHandler.connect("tick", play_tick)
	DialogueHandler.connect("rewind_timer_anim", play_rewind)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_tick():
	if !$Control/AnimatedSprite2D.is_playing():
		$Control/AnimatedSprite2D.play("tick")
	
func play_rewind():
	$Control/AnimatedSprite2D.play("rewind")
	await $Control/AnimatedSprite2D.animation_finished
	DialogueHandler.rewind.emit()
	DialogueHandler.rewind_game();
	DialogueHandler.hold_time = 0
	hide()
