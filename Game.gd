extends Node2D




func _ready():
	$Game_over_panel.hide()
	$player.connect("player_shot", self, "_on_game_over")
	for g in $gunners.get_children():
		g.connect("gunner_shot", self, "_on_gunner_shot")
	$start_timer.start()

func _process(delta):
	$green_timer_label.text = str($green_timer.time_left)

func _on_start_timer_timeout():
	$green_timer.start()
	$player.can_move = true

func _on_green_timer_timeout():
	$doll.rotate_doll_to_red($player.global_position)
	$red_timer.start()
	for g in $gunners.get_children():
		g.shoot()
		
		
func _on_red_timer_timeout():
	$doll.rotate_doll_to_green($green_position)
	$green_timer.start()

func _on_gunner_shot():
	$player.check_shot()


func _on_game_over():
	$green_timer.stop()
	$Game_over_panel.show()

func _on_play_again_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_quit_button_pressed():
	get_tree().change_scene("res://menu.tscn")


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		$Game_over_panel/Label.text = "YOU WIN!!"
		_on_game_over()
