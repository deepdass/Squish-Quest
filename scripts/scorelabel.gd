extends Area2D

@onready var label_3: Label = $"../../Label3"
@onready var label: Label = $"../../Label"
@onready var label_2: Label = $"../../Label2"

func _on_body_entered(body: Node2D) -> void:
	label.visible = true
	label_3.visible = true
	label_2.visible = true
