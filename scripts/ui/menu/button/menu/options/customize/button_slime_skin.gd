extends UiMenuButton

func setting_slide_left():
	if global.slime_skin_type > global.CUSTOM_SLIME_SKIN.default:
		global.slime_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.slime_skin_type < global.CUSTOM_SLIME_SKIN.none:
		global.slime_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.slime_skin_type == global.CUSTOM_SLIME_SKIN.none:
		frame = 3
	elif global.slime_skin_type == global.CUSTOM_SLIME_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.slime_skin_type:
		global.CUSTOM_SLIME_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_SLIME_SKIN.none:
			label.text = "Skin:\nNone"
