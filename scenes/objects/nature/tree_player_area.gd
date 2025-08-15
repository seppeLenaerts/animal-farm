extends Area2D

class_name IsPlayerNearObjectDetector

var is_close = false

func _on_body_entered(body: Node2D):
	if body is Player:
		print("Ik ben bij een boom")
		is_close = true

func _on_body_exited(body: Node2D):
	if body is Player:
		is_close = false
		print("Ik ben NIET bij een boom")

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
