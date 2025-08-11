extends Node

"""
Minimal inventory system implementation. 
It's just a dictionary where items are identified by a string key and hold an int amount
"""

# action can be 'added' some amount of some items is added and 'removed' when some amount
# of some item is removed
signal item_changed(action, type, amount, ingrediente)

# This variable will now be set by another script.
var coins_label: Label = null # Initialize as null, specify type for clarity

@export var inventory: int = 0
var flecha = preload("res://scenes/items/Flecha.tscn")

# --- NEW FUNCTION: This function will be called by your main scene's script ---
func set_ui_label(label_node: Label):
	if label_node != null and label_node is Label:
		coins_label = label_node
		print("Inventory script: CoinLabel reference successfully set!")
	else:
		print("Inventory script: ERROR! Attempted to set coins_label with an invalid node.")

# We removed the _ready() function that tried to find the node here.
# func _ready():
# 	# ... (removed old find_node logic) ...

func add_item(ingrediente:String) -> bool:
	inventory += 1
	
	# Check if coins_label is valid BEFORE trying to set its text
	if coins_label != null:
		coins_label.text = "Ingredientes " + str(inventory)
	else:
		print("ERROR: coins_label is still null in add_item! Cannot update UI. Has the main scene set the reference?")
		return false 
	
	if inventory == 1:
		Dialogs.show_dialog("""no hay fuerza militar imperialista
que pueda detener mi peda...
ser un chavo bien
es un acto #político""", "")
		
	if inventory == 2:
		Dialogs.show_dialog("""tengo que brindar por
toda la gente que murió hoy.
esto ya no solo se trata
sobre mí......""", "")
		
	if inventory == 3:
		Dialogs.show_dialog("""será que toda esta destrucción
es tan solo una metáfora de lo que sucede
dentro de mi jodido mundo interno?
...
...
...
...
nah no creo""", "")
		
	if inventory == 4:
		Dialogs.show_dialog("""embeses solo somos mi cubita,
la música y yo
contra este fokin world
...
...
no lo entenderías...........""", "")
		
	if inventory == 5:
		print("Trigger Scene")
		var object = flecha.instantiate()
		object.position = Vector2(1713, 3379)
		get_parent().add_child(object)

		Dialogs.show_dialog("""a huevo!
ahora sí, me la pela el fin del mundo
solo necesito volver a mi yate""", "")
	
	print(inventory)
	return true
