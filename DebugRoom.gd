extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player != null:
		$PlayerDebugLabels.position = $Player.position
		$PlayerDebugLabels/WeaponAngle.text = "WEAPON ANGLE = "+str($Player/WeaponAnchor.rotation)
		$PlayerDebugLabels/PlayerAngle.text = "PLAYER ANGLE = "+str($Player.rotation)
	pass
