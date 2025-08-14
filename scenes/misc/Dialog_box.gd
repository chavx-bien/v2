extends TextureRect
class_name DialogBox

@onready var dialog_text = $dialog_text
@onready var lines_per_page = 0
@onready var current_page = 0
@onready var pages: Array = []

signal dialog_started
signal dialog_ended

func _ready() -> void:
	Dialogs.dialog_box = self
	hide()

func show_dialog(new_text: String, speaker: String) -> void:
	# Reset paging
	current_page = 0
	lines_per_page = dialog_text.get_visible_line_count()

	# Pre-split text into pages
	var all_lines = new_text.split("\n")
	pages.clear()
	for i in range(0, all_lines.size(), lines_per_page):
		pages.append("\n".join(all_lines.slice(i, i + lines_per_page)))

	# Show first page
	$nametag/label.text = speaker
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
