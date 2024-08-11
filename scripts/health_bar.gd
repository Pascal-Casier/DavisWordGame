extends Control

func _ready() -> void:
	Global.damage.connect(on_damage_received)

func on_damage_received(value):
	Global.health -= value
	%ProgressBar.value = Global.health
	if Global.health <= 0:
		Global.game_over.emit()
