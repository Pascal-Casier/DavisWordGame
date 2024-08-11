extends Control


func _on_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://davis_word_game.tscn")


func _on_button_exit_pressed() -> void:
	get_tree().quit()
