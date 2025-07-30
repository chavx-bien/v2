extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Dialogs.show_dialog("NPC texto yeah", "")
	Dialogs.dialog_ended
