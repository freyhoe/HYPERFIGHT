extends UiMenuButton

func setting_slide_left():
	if global.scythe_skin_type > global.CUSTOM_SCYTHE_SKIN.default:
		global.scythe_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.scythe_skin_type < global.CUSTOM_SCYTHE_SKIN.none:
		global.scythe_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.scythe_skin_type == global.CUSTOM_SCYTHE_SKIN.none:
		frame = 3
	elif global.scythe_skin_type == global.CUSTOM_SCYTHE_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.scythe_skin_type:
		global.CUSTOM_SCYTHE_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_SCYTHE_SKIN.none:
			label.text = "Skin:\nNone"
