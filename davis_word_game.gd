extends CanvasLayer


func _on_button_1_pressed() -> void:
	var scene_path = "res://chap" + str(Global.chapter_nbr) + ".tscn"
	if ResourceLoader.exists(scene_path):
		get_tree().change_scene_to_file("res://chap" + str(Global.chapter_nbr) + ".tscn")
