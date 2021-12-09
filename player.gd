extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var speed = 100

var can_move = false

signal player_shot

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		velocity = Vector2.ZERO
		if Input.is_action_pressed("ui_up"):
			velocity.y -=1
		if Input.is_action_pressed("ui_down"):
			velocity.y +=1	
		if Input.is_action_pressed("ui_left"):
			velocity.x -=1
		if Input.is_action_pressed("ui_right"):
			velocity.x +=1
	
	velocity = move_and_slide(velocity.normalized() * speed)

func check_shot():
	if velocity != Vector2.ZERO:
		emit_signal("player_shot")
