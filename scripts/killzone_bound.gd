extends Area2D
@warning_ignore("unused_parameter")
@onready var game_manager: Node = %gameManager

func _on_body_entered(body: Node2D) -> void:
	game_manager.decrease_health()
	game_manager.decrease_health()
	game_manager.decrease_health()
