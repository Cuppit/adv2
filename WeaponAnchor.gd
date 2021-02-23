extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var weapon_owner

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon_owner = get_parent()
	print("   -in WeaponAnchor.gd _ready(): WeaponAnchor for Player initialized.   weapon_owner = "+str(weapon_owner))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
