extends UiMenuButton

func setting_slide_left():
	if global.goto_skin_type > global.CUSTOM_GOTO_SKIN.default:
		global.goto_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.goto_skin_type < global.CUSTOM_GOTO_SKIN.none:
		global.goto_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.goto_skin_type == global.CUSTOM_GOTO_SKIN.none:
		frame = 3
	elif global.goto_skin_type == global.CUSTOM_GOTO_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.goto_skin_type:
		global.CUSTOM_GOTO_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_GOTO_SKIN.none:
			label.text = "Skin:\nNone"
