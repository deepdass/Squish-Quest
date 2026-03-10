extends Node

var score = 0
var lives = 3
@onready var label_2: Label = $"../Label2"
@onready var timer: Timer = $Timer
@onready var label_3: Label = $"../Label3"
@onready var sprite_2d: Sprite2D = $"../Label3/Sprite2D"
@onready var sprite_2d_2: Sprite2D = $"../Label3/Sprite2D2"

@export var hearts : Array[Node]
func decrease_health():
	lives -= 1
	print(lives)
	for i in hearts.size():
		if (i < lives):
			hearts[i].show()
		else:
			hearts[i].hide()
				
	if lives == 0:
		timer.start()
		Engine.time_scale = 0.3

func add_point():
	score += 1
	label_2.text = ("Total Coins Collected: "+str(score))
	if score == 25:
		sprite_2d.visible = true
		sprite_2d_2.visible = true
		label_3.text = ("Only if these were SSSs")
	else:
		label_3.text = ("Try Collecting All coins")


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
