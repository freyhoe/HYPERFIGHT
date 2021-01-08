extends UiMenuButton

onready var page_one = get_node("1")
onready var page_two = get_node("2")
onready var page_three = get_node("3")

onready var arrow_left = get_node("arrow_left")
onready var arrow_right = get_node("arrow_right")
onready var label_page = get_node("label_page")

var max_pages = 3
var curr_page = 1

func _process(delta):
	if Input.is_action_just_pressed(global.INPUT_PLAYER1 + global.INPUT_ACTION_LEFT):
		curr_page -= 1
		if curr_page < 1:
			curr_page = 1
	if Input.is_action_just_pressed(global.INPUT_PLAYER1 + global.INPUT_ACTION_RIGHT):
		curr_page += 1
		if curr_page > max_pages:
			curr_page = max_pages
	set_page(curr_page)

func set_page(page):
	for child in get_children():
		if child.is_in_group("page"):
			child.visible = false
	match page:
		1:
			page_one.visible = true
		2:
			page_two.visible = true
		3:
			page_three.visible = true
	label_page.text = str(curr_page) + "/" + str(max_pages)
