extends CanvasLayer

signal restart
signal menu

func _on_button_pressed():
	restart.emit()

func _on_menu_button_pressed() -> void:
	menu.emit()
