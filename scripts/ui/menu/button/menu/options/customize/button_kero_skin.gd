extends UiMenuButton

func setting_slide_left():
	if global.kero_skin_type > global.CUSTOM_KERO_SKIN.default:
		global.kero_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.kero_skin_type < global.CUSTOM_KERO_SKIN.none:
		global.kero_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.kero_skin_type == global.CUSTOM_KERO_SKIN.none:
		frame = 3
	elif global.kero_skin_type == global.CUSTOM_KERO_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.kero_skin_type:
		global.CUSTOM_KERO_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_KERO_SKIN.none:
			label.text = "Skin:\nNone"
