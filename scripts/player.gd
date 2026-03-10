extends CharacterBody2D

const SPEED = 110.0
const GRAVITY_MULTIPLYER = 1.6
const JUMP_VELOCITY = -470.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func jumpside(x):
	audio_stream_player_2d.play()
	velocity.y = JUMP_VELOCITY*0.4
	velocity.x = x

func jumpkill():
	velocity.y = JUMP_VELOCITY
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * GRAVITY_MULTIPLYER * delta 
		
	var was_on_floor = is_on_floor()
	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() || !timer.is_stopped()) :
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_l", "move_r")

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if was_on_floor && !is_on_floor():
		timer.start()
	

	
	
