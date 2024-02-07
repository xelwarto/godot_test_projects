extends CharacterBody2D
var speed = 750

func start(_position, _direction):
	position = _position
	var delta = _direction
	velocity = Vector2((speed * delta), 0).rotated(0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().name != "Player":
			queue_free()
		#velocity = velocity.bounce(collision.get_normal())
		#if collision.get_collider().has_method("hit"):
			#collision.get_collider().hit()

func _on_bullet_time_timeout():
	queue_free()
