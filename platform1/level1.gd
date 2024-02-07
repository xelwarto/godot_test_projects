extends Node

func _ready():
	#$Player.position = Vector2(50, 837)
	pass

func _on_portal_body_entered(body):
	if body.name == "Player":
		var ls:PackedScene = ResourceLoader.load("res://level2.tscn")
		var s = ls.instantiate()
		get_tree().root.add_child.call_deferred(s)
		call_deferred("queue_free")
