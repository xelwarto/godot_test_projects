extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player1.position = Vector2(54, 870)

func _on_portal_body_entered(body):
	if body.name == "Player1":
		var ls:PackedScene = ResourceLoader.load("res://level1.tscn")
		var s = ls.instantiate()
		get_tree().root.add_child.call_deferred(s)
		call_deferred("queue_free")
