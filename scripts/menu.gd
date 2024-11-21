extends CanvasLayer

signal start
signal quit

func _on_start_pressed():
	start.emit()

func _on_quit_pressed():
	get_tree().quit()
