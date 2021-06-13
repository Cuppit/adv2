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

var target = null # Node instance this enemy follows when following an entity.



# Called when the node enters the scene tree for the first time.
func _ready():
	rotate(PI/2) # Initialize rotation so chin is facing mouse
	pass # Replace with function body.
	


func _physics_process(delta):
	follow_target() # Follows current target, if any.
	move_and_slide(velocity, Vector2.UP)


func proc_behavior():

	pass


func _process(delta):
	proc_behavior()
	pass

# DEPRECATED: use "process_effect()" instead
func sustain_hit():
	hp = hp-1
	if (hp <= 0):
		hide()
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)

func process_effect(effect):
	hp += effect.hp_change
	
	
	var somestr = "hi"
	print(str(somestr.type()))
	
	
	
	pass


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

func follow_target():
		if (target != null):
			
			velocity = (target.position - position).normalized() * speed

func _on_AggroRadius_body_entered(body):


	if (body.is_in_group("player_allies")):
			# stop patrol timers
		$PatrolMoveTimer.stop()
		$PatrolIdleTimer.stop()
		
		target = body
	# continually move and adjust direction to 
	# move towards player

	
	# get_angle_to(get_global_mouse_position())

