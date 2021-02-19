extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var swingspeed = 0.01 #angle in radians to rotate weapon every game cycle

# Called when the node enters the scene tree for the first time.
func _ready():
		
		# Position weapon away from player
		$CollisionShape2D.position.y += 60
		pass

var has_played = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if (has_played == false):

		
		
		print("  -in Weapon.gd script.  Attempting to play swinging animation:")
		$WeaponSwing.play("Angle")
		print("    -The animation should have played.")
		has_played = true

func _process(delta):
	pass

func _on_Weapon_body_entered(body):
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
