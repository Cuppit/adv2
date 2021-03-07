# This is a generic object used to hold data about 
# an effect being imposed on a character (most commonly an "attack").



extends Node

var hp_change = 0 # 
var knockback = 0 # The force of knockback being applied to the target of this attack.
var flinch = false # Whether or not the target "flinches" when affected by this effect
				   # (cancelling any in-progress actions and blocking actions taken for some
				   #  very short period of time, such as 0.25 seconds)
var signal_to_emit = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(hp_chng=0,kb=0,flin=false):
	hp_change=hp_chng
	knockback=kb
	flinch=flin
	
	pass
	
	
# Manually set HP change this effect causes.
func set_hp(amt):
	hp_change = amt
	
# Manually set knockback.
func set_knockback(kb):
	knockback = kb
	
func set_flinch(fln):
	flinch = fln

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
