extends Node

var test:PackedScene = preload("res://scene_manager.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var t = test.instantiate()
	get_tree().root.add_child.call_deferred(t)
	queue_free()
