extends Node

var l1_s:PackedScene = preload("res://level1.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var t = l1_s.instantiate()
	#t.name = "Level1"
	get_tree().root.add_child(t)
