extends Sprite


var target = null

signal gunner_shot

func _ready():
	pass # Replace with function body.


func _process(delta):
	if target:
		look_at(target.global_position)

func shoot():
	print("shooting")
	$flash/AnimationPlayer.play("New Anim")
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().is_in_group("player"):
			emit_signal("gunner_shot")

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		target = body
