extends Control


func _ready():
	pass # Replace with function body.



func _on_start_button_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
