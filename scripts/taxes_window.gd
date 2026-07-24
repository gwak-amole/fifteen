extends Control
@export var viewer_2007: TextureRect
@export var viewer_2006: TextureRect
@export var viewer_2005: TextureRect
signal make_me_front(arg: String)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if viewer_2005:
		viewer_2005.hide()
	viewer_2006.hide()
	viewer_2007.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_2005_pressed() -> void:
	viewer_2005.show()


func _on_2006_pressed() -> void:
	viewer_2006.show()


func _on_2007_pressed() -> void:
	viewer_2007.show()


func _on_xbutton_pressed() -> void:
	hide()


func _on_title_bar_make_front() -> void:
	if name.contains("family"):
		make_me_front.emit("fam")
	elif name.contains("taxes"):
		make_me_front.emit("taxes")
	elif name.contains("vacation"):
		make_me_front.emit("vacation")
	elif name.contains("documents"):
		make_me_front.emit("documents")
