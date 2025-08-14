extends TextureRect
class_name DialogBox

@onready var dialog_text = $dialog_text
@onready var lines_per_page = 2   # two lines per page
@onready var chars_per_line = 40  # adjust based on font size & label width

var pages: Array = []
var current_page = 0

signal dialog_started
signal dialog_ended

func _ready() -> void:
	Dialogs.dialog_box = self
	hide()

func show_dialog(new_text: String, speaker: String) -> void:
	current_page = 0
	pages.clear()
	$nametag/label.text = speaker

	# Split text into pages
	var index = 0
	while index < new_text.length():
		var page_text = new_text.substr(index, chars_per_line * lines_per_page)
		pages.append(page_text)
		index += page_text.length()

	show_page()
	$anims.play("appear")

func show_page() -> void:
	if current_page < pages.size():
		dialog_text.text = pages[current_page]
		$anims.play("wait")
	else:
		$anims.play("disappear")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		current_page += 1
		show_page()
