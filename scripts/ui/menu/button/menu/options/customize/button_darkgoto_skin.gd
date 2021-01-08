extends UiMenuButton

func setting_slide_left():
	if global.darkgoto_skin_type > global.CUSTOM_DARKGOTO_SKIN.default:
		global.darkgoto_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.darkgoto_skin_type < global.CUSTOM_DARKGOTO_SKIN.none:
		global.darkgoto_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.darkgoto_skin_type == global.CUSTOM_DARKGOTO_SKIN.none:
		frame = 3
	elif global.darkgoto_skin_type == global.CUSTOM_DARKGOTO_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.darkgoto_skin_type:
		global.CUSTOM_DARKGOTO_SKIN.default:
			label.text = "Skin: Default"
		global.CUSTOM_DARKGOTO_SKIN.none:
			label.text = "Skin: None"
