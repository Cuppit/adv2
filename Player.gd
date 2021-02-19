extends KinematicBody2D

export var speed = 400

var screen_size

signal labellable

# cache weapon for fast access
var Weapon = preload("res://Weapon.tscn")
var curr_weapon = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	
		
	# Rotation based on mouse position
	#var xvect = position.x - get_global_mouse_position().x
	#var yvect = position.y - get_global_mouse_position().y
	
	#rotation = atan(yvect/xvect)
	rotate(get_angle_to(get_global_mouse_position()))
	#var rotspeed : = 12.0
	#var target_angle : = get_angle_to(get_global_mouse_position())
	#var rotation_amount : = min(abs(target_angle), rotspeed * delta) * sign(target_angle)
	#rotate(rotation_amount)
	#rotation = acos( xvect / sqrt(pow(xvect,2) + pow(yvect,2)) )
	
	
	
	# Moving
	var velocity = Vector2()
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
	
	move_and_slide(velocity, Vector2.UP)
	
	# Attacking
	
	if Input.is_action_just_pressed("attack"):
		
		if (curr_weapon == null):
			print("attacking. curr_weapon value is presently: "+str(curr_weapon))
			curr_weapon = Weapon.instance()
			print("   -after instancing weapon during attack, curr_weapon="+str(curr_weapon))
			curr_weapon.position = $PlayerPosition.position
			#curr_weapon.position.x += 50
			curr_weapon.position.y += 50
			
			var weap_angle = $PlayerPosition.get_angle_to(get_global_mouse_position()) - PI/2
			$WeaponAnchor.rotation = weap_angle
			
			
			#weapon.add_collision_exception_with(self) # don't want player to collide with bullet
			#actual weapon rotation
			#curr_weapon.get_node("WeaponSwing").play()
			
			$WeaponAnchor.add_child(curr_weapon)
	
	#If an attack is in progress (inidicated by the weapon still existing)...
	if (curr_weapon != null):
		#...ensure it stays connected to the player that swung it.
		#curr_weapon.position = $PlayerPosition.position
		pass
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

