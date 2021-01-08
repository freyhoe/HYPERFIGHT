extends UiMenuButton

func setting_slide_left():
	if global.yoyo_skin_type > global.CUSTOM_YOYO_SKIN.default:
		global.yoyo_skin_type -= 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.yoyo_skin_type < global.CUSTOM_YOYO_SKIN.none:
		global.yoyo_skin_type += 1
		global.set_skin_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.yoyo_skin_type == global.CUSTOM_YOYO_SKIN.none:
		frame = 3
	elif global.yoyo_skin_type == global.CUSTOM_YOYO_SKIN.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.yoyo_skin_type:
		global.CUSTOM_YOYO_SKIN.default:
			label.text = "Skin:\nDefault"
		global.CUSTOM_YOYO_SKIN.lightning:
			label.text = "Skin:\nLightning"
		global.CUSTOM_YOYO_SKIN.none:
			label.text = "Skin:\nNone"
