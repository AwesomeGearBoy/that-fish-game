extends CanvasLayer

signal start

func _on_start_pressed():
	start.emit()

func _on_quit_pressed():
	get_tree().quit()
