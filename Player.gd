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
var tw:=Tween.new()
var path=[]

func _ready():
	add_child(tw)
	tw.connect("tween_all_completed",self,"destination_reached")
	screen_size = get_viewport_rect().size
	set_process(false)
	set_physics_process(false)
	show()

func destination_reached():
	velocity=Vector2(0,0)
	initiated_by_code=false
	$CollisionShape2D.disabled=false
	#set_process(false)

#func fly(flyto, ts, jumpht,e):
#	#$Gopal.fly(target)
#	tw.interpolate_property($Gopal, "position:x", $Gopal.position.x, flyto.x, ts, Tween.TRANS_LINEAR)
#	#tw.interpolate_property($Gopal, "position:y", $Gopal.position.y, flyto.y, ts/2, Tween.TRANS_QUAD, e[0])
#	tw.interpolate_property($Gopal, "position:y", $Gopal.position.y, jumpht, ts/2, Tween.TRANS_EXPO, e[1])
#	tw.interpolate_property($Gopal, "position:y", jumpht, flyto.y, ts/2, Tween.TRANS_SINE, e[1], ts/2)
	
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

func goto(pos):
	initiated_by_code=true
	$CollisionShape2D.disabled = true
	set_process(true)
	var distance=position.distance_to(pos)
	var direction=position.direction_to(pos)
	velocity=direction
	var time=distance/speed
	tw.interpolate_property(self,"position", position, pos, time)
	tw.start()
	var x=yield(tw, 'tween_all_completed')

func _process(delta):
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.y += 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		set_process(false)
	
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
	#print('noo', position)
	show()
	$CollisionShape2D.disabled = false

#func _on_Player_area_entered(area):
	#emit_signal('hit',area.name)
	#print(area.name+' entered')
	#pass # Replace with function body.


		#distance=$Gopal.position.distance_to(target)
		#var direction=$Gopal.position.direction_to(target)
		#$Gopal.velocity=direction
		#time=distance/$Gopal.speed
#		if abs(distance) > 250 :
#			var jumpht
#			var e
#			if target.y < $Gopal.position.y: # head down
#				jumpht=target.y-40
#				e=[Tween.EASE_IN, Tween.EASE_IN]
#			else:
#				jumpht=$Gopal.position.y-20
#				e=[Tween.EASE_OUT, Tween.EASE_OUT]
#			fly(target, time, jumpht, e)
##			print(direction.y,' ', $Gopal.position,' ', gpos,' ', distance)
##			if direction.y >0:# up
##				print('down', rad2deg($Gopal.position.angle_to_point(gpos)))
##				fly(gpos, time, -2*96, [Tween.EASE_IN, Tween.EASE_IN])
##			else:
##				print('up', rad2deg($Gopal.position.angle_to_point(gpos)))
##				fly(gpos, time, -96,[Tween.EASE_IN, Tween.EASE_OUT] )
#		else:
		#tw.interpolate_property($Gopal,"position",$Gopal.position,target,time)
		#tw.start()
