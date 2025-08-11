extends Node # Or whatever the root node of your 2D scene is (e.g., Node)

@onready var coin_label_node = $UI/CoinLabel # This path should be correct for your main scene

func _ready():
	Dialogs.show_dialog("""no mames valió verga acapulco RIP
qué llevaría a la humanidad 
a degradarse hasta el punto
de arriesgar la extinción masiva?
es acaso el MALDITO dinero???
bueno, lo bueno es que mi yate
está intacto
solo tengo que recuperar
los ingredientes (5)
para armarme una cuba
y volver a mi yate""", "")
	# Ensure the Inventory Autoload is available.
	# The name "Inventory" here must match the name you gave your inventory.gd Autoload in Project Settings > Globals.
	if has_node("/root/Inventory"): # Check if the Autoload exists in the scene tree
		var inventory_autoload = get_node("/root/Inventory")
		# Call the new function in your inventory script to pass the label reference
		inventory_autoload.set_ui_label(coin_label_node)
		print("MainScene: Passed CoinLabel reference to Inventory Autoload.")
	else:
		print("MainScene: ERROR! Inventory Autoload not found. Is it correctly set up in Project Settings > Globals?")
