extends Node2D

var apples = 0
var stamina = 100.0

func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func add_apple() -> void:
	apples += 1

func use_stamina(consumed: float) -> void:
	stamina -= consumed
