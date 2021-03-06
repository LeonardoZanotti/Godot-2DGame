extends Actor

export var deathScore := 100

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -_speed.x

func _on_StompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	die()

func _physics_process(delta: float) -> void:
	_velocity.y += _gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func die() -> void:
	get_node("CollisionShape2D").disabled = true
	queue_free()
	PlayerData.score += deathScore
