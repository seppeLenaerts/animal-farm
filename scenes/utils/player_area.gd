extends Area2D

class_name PlayerDetector

var is_close = false

func _on_body_entered(body: Node2D):
	if body is Player:
		is_close = true

func _on_body_exited(body: Node2D):
	if body is Player:
		is_close = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)