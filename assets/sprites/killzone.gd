extends Area2D
@warning_ignore("unused_parameter")
@onready var game_manager: Node = get_node("/root/Game/gameManager")

func _on_body_entered(body: Node2D) -> void:
	var x_delta = body.position.x - position.x
	game_manager.decrease_health()
	if (x_delta > 0):
		body.jumpside(-650)
	else:
		body.jumpside(650)
