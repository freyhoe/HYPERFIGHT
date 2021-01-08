extends UiMenuButton

func setting_slide_left():
	if global.time_skin_type > global.CUSTOM_TIME_SKIN.default:
		global.time_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.time_skin_type < global.CUSTOM_TIME_SKIN.none:
		global.time_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.time_skin_type == global.CUSTOM_TIME_SKIN.none:
		frame = 3
	elif global.time_skin_type == global.CUSTOM_TIME_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.time_skin_type:
		global.CUSTOM_TIME_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_TIME_SKIN.xmas:
			label.text = "Skin:\nXmas"
		global.CUSTOM_TIME_SKIN.none:
			label.text = "Skin:\nNone"
