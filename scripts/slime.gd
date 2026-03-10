extends Node2D

const SPEED = 30
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_rightdown: RayCast2D = $RayCastRightdown
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_leftdown: RayCast2D = $RayCastLeftdown
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var direction = 1

func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding() or (ray_cast_rightdown.is_colliding() == false):
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding() or (ray_cast_leftdown.is_colliding() == false):
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta
	

func _on_dieee_body_entered(body: Node2D) -> void:
	var y_delta = position.y - body.position.y
	if y_delta > -9:
		body.jumpkill()
		animation_player.play("squash")
	
