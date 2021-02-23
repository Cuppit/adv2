extends Area2D

onready var Player = $Player
onready var Enemy = $Enemy

 # TODO WARNING: This assumes weapon is ALWAYS a child of WeaponAnchor!
var weapon_owner
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var swingspeed = 0.01 #angle in radians to rotate weapon every game cycle


# Called when the node enters the scene tree for the first time.
func _ready():
		#weapon_owner = get_parent().weapon_owner
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
# if nodeA.get_filename() == sceneA.get_path():
func _on_Weapon_body_entered(body):
	print("   -in Weapon.gd: weapon entered body.  Weapon's parent is: "+str(get_parent()))
	if body.is_in_group("enemies") and get_parent().weapon_owner.is_in_group("player_allies"):
		print("YOU JUST SMACKED AN ENEMY STOP IT YOU MYSOGINISTIC PIC!")
		body.sustain_hit()
		pass
	pass # Replace with function body.



func _on_Timer_timeout():
	queue_free()
