extends Area2D

var player_in_area = false

func _on_body_entered(body: Node2D):
	if body is Player:
		print("Ik ben bij een boom")
		player_in_area = true

func _on_body_exited(body: Node2D):
	if body is Player:
		player_in_area = true
		print("Ik ben NIET bij een boom")

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
