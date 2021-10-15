extends Area2D
#signal hit

# Declare member variables here. Examples:
export var speed = 400
var screen_size
export var velocity:=Vector2(0,0)
export var initiated_by_code:=false
#var _target = null
#var acceleration=Vector2.ZERO
#var steer_force=10.0

func _ready():
	screen_size = get_viewport_rect().size
	set_physics_process(false)
	show()

#func fly(target):
#	_target=target
#	velocity.y=100#angle()
#	set_physics_process(true)
#
#func seek():
#	var steer = Vector2.ZERO
#	if _target:
#		var desired = (_target - position).normalized() * speed
#		steer = (desired - velocity).normalized() * steer_force
#	return steer

#func _physics_process(delta):
#	#acceleration += seek()
#	#velocity += acceleration * delta
#	#velocity = velocity.clamped(speed)
#	#rotation = velocity.angle()
#	position += velocity * delta
#	if position - _target > Vector2(0.1, 0.1) :
#		_target=null
#		set_physics_process(false)
#		emit_signal('reached')

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	if not initiated_by_code:
		position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0

	if not initiated_by_code:
		velocity=Vector2(0, 0)

#func _on_Player_body_entered(body):
#	hide()#pass # Replace with function body.
#	emit_signal("hit")
#	$CollisionShape2D.set_deferred("disabled",true)
		
func place_at(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

#func _on_Player_area_entered(area):
	#emit_signal('hit',area.name)
	#print(area.name+' entered')
	#pass # Replace with function body.
