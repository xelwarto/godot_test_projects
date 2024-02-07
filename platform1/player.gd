extends CharacterBody2D

var Bullet = preload("res://bullet.tscn")

@export var speed = 300.0
@export var jump_velocity = -500.0
@export var muizzle_x = 0
@export var muizzle_y = 0
var face_direction = 1


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		face_direction = direction
		velocity.x = direction * speed
		
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
		
		if is_on_floor():
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
	else:
		velocity.x = move_toward(velocity.x, 0, 30)
		
		if velocity.x == 0:
			$AnimatedSprite2D.stop()
			
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	move_and_slide()
	
	#if get_slide_collision_count() > 0:
		#var c = get_last_slide_collision()
		#print(c.get_collider().name)

func shoot():
	$Muzzle.global_position = (
		transform * Vector2((muizzle_x * face_direction), muizzle_y)
	)
	var b = Bullet.instantiate()	
	b.start($Muzzle.global_position, face_direction)
	get_parent().add_child(b)
