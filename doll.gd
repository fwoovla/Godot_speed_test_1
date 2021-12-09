extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func rotate_doll_to_red(player):
	look_at(player)
	
func rotate_doll_to_green(pos):
	look_at(pos)
	
