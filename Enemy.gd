extends KinematicBody2D

var rng = RandomNumberGenerator.new()

var velocity = Vector2()

signal hit # Emitted when enemy collides with a Weapon object

# Enemy entity stats
export var hp = 3
export var speed = 100

var screen_size

signal labellable

# cache weapon for fast access
var Weapon = preload("res://Weapon.tscn")
var curre_weapon = null

# various mechanics flags and variables
var patrol_move_time = 1 # Amount of time this enemy moves when patrolling
var patrol_idle_time = 2 # Amount of time this enemy stands still before continuing movement during patrol
var aggroed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rotate(PI/2) # Initialize rotation so chin is facing mouse
	pass # Replace with function body.
	


func _physics_process(delta):
	move_and_slide(velocity, Vector2.UP)
	"""
		
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
		
		if (curre_weapon == null):
			print("attacking. curr_weapon value is presently: "+str(curre_weapon))
			curre_weapon = Weapon.instance()
			print("   -after instancing weapon during attack, curr_weapon="+str(curre_weapon))
			curre_weapon.position = $EnemyPosition.position
			#curr_weapon.position.x += 50
			curre_weapon.position.y += 50
			
			var weap_angle = $EnemyPosition.get_angle_to(get_global_mouse_position()) - PI/2
			$WeaponAnchor.rotation = weap_angle
			
			
			#weapon.add_collision_exception_with(self) # don't want player to collide with bullet
			#actual weapon rotation
			#curr_weapon.get_node("WeaponSwing").play()
			
			$WeaponAnchor.add_child(curre_weapon)
	
	"""
	#If an attack is in progress (inidicated by the weapon still existing)...
	if (curre_weapon != null):
		#...ensure it stays connected to the player that swung it.
		#curr_weapon.position = $PlayerPosition.position
		pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.


# This function handles behavior activity of this enemy

func proc_behavior():

	pass


func _process(delta):
	proc_behavior()
	pass


	
# --- Misc Utility Functions ---

	
			
			
	# TODO: design and break down the behavior of an enemy every game cycle
	pass
func sustain_hit():
	hp = hp-1
	if (hp <= 0):
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)


func _on_PatrolMoveTimer_timeout():
	$PatrolMoveTimer.stop()
	$PatrolIdleTimer.start(2)
	velocity.x = 0
	velocity.y = 0
	velocity = velocity.normalized() * speed


func _on_PatrolIdleTimer_timeout():
	$PatrolIdleTimer.stop()
	$PatrolMoveTimer.start(1)
	velocity.x = rng.randf_range(-1.0, 1.0)
	velocity.y = rng.randf_range(-1.0, 1.0)
	velocity = velocity.normalized() * speed

	
	pass # Replace with function body.
