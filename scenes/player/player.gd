extends CharacterBody2D


@export var camera : Camera2D

const SPEED = 233.0


func _physics_process(_delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * SPEED
	move_and_slide()