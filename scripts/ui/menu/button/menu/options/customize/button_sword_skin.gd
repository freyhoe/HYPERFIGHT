extends UiMenuButton

func setting_slide_left():
	if global.sword_skin_type > global.CUSTOM_SWORD_SKIN.default:
		global.sword_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.sword_skin_type < global.CUSTOM_SWORD_SKIN.none:
		global.sword_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.sword_skin_type == global.CUSTOM_SWORD_SKIN.none:
		frame = 3
	elif global.sword_skin_type == global.CUSTOM_SWORD_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.sword_skin_type:
		global.CUSTOM_SWORD_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_SWORD_SKIN.none:
			label.text = "Skin:\nNone"
