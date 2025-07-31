extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Dialogs.show_dialog("we este ataque fue provocado
	por las élites tecnofeudalistas
	los dueños de las empresas tecnológicas
	buscan tomar el control de los gobiernos
	como no pueden utilizar las vías democráticas
	utilizan la fuerza
	en realidad no es tan complicado
	pasar de programar una red social,
	un videojuego o un ataque nuclear
	todo utiliza javascript...
	en fin, seguimos resistiendo compañero
	no olvides utilizar el #ChavosBien2
	y compartir este juego
	que nos costó un vergo hacer", "")
	Dialogs.dialog_ended
