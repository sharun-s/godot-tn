extends Area2D
signal hit

# Declare member variables here. Examples:
export var speed = 400
var screen_size
export var velocity:=Vector2()
export var initiated_by_code:=false

func _ready():
	screen_size = get_viewport_rect().size
	show()
	
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

#func _on_Player_body_entered(body):
#	hide()#pass # Replace with function body.
#	emit_signal("hit")
#	$CollisionShape2D.set_deferred("disabled",true)
		
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_Player_area_entered(area):
	emit_signal('hit',area.name)
	#print(area.name+' entered')
	#pass # Replace with function body.
