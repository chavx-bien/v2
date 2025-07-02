extends Area2D

@export var item_type: String = "Generic Item"
@export var amount: int = 1
@export var ingredientes: Array = ["Vaso", "Coca", "Hielo", "Bacardi", "Mineral", "Flecha"]
@export var ingrediente: String = ""
var active = false

func _input(event):
	# Bail if npc not active (player not inside the collider)
	if not active:
		return
	# Bail if Dialogs singleton is showing another dialog
	if Dialogs.active:
		return
	# Bail if the event is not a pressed "interact" action
	if not event.is_action_pressed("interact"):
		return

func _ready():
	body_entered.connect(_on_Item_body_entered)
	pass

func _on_Item_body_entered(body):
	var ingrediente: String = ""
	ingrediente = self.name
	if body is Player:
		body_entered.disconnect(_on_Item_body_entered)
		match ingrediente:
			"Vaso":
				Dialogs.show_dialog("Vaso", "Vaso")
				Dialogs.dialog_ended
			"Coca":
				Dialogs.show_dialog("Coca", "Coca")
				Dialogs.dialog_ended
			"Hielo":
				Dialogs.show_dialog("Hielo", "Hielo")
				Dialogs.dialog_ended
			"Bacardi":
				Dialogs.show_dialog("Bacardi", "Bacardi")
				Dialogs.dialog_ended
			"Mineral":
				Dialogs.show_dialog("Mineral", "Mineral")
				Dialogs.dialog_ended
			"Flecha":
				Dialogs.show_dialog("Flecha", "Flecha")
				Dialogs.dialog_ended
		#Dialogs.show_dialog("", "")
		#Dialogs.dialog_ended
		Inventory.add_item(ingrediente)
		$anims.play("collected")
	pass
