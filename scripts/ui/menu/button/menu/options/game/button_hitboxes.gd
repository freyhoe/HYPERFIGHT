extends UiMenuButton

func setting_slide_left():
	if global.hitboxes:
		global.hitboxes = false
	global.set_hitboxes()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if not global.hitboxes:
		global.hitboxes = true
	global.set_hitboxes()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.hitboxes:
		frame = 3
	else:
		frame = 2

func set_label_text():
	if global.hitboxes:
		label.text = "HITBOXES: On"
	else:
		label.text = "HITBOXES: Off"
