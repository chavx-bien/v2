extends Area2D

const NIVEL_2 = "res://scenes/levels/nivel_2.tscn"


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file(NIVEL_2)
