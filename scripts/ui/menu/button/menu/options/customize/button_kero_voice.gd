extends UiMenuButton

func setting_slide_left():
	if global.kero_voice_type > global.CUSTOM_KERO_VOICE.default:
		global.kero_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.kero_voice_type < global.CUSTOM_KERO_VOICE.none:
		global.kero_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.kero_voice_type == global.CUSTOM_KERO_VOICE.none:
		frame = 3
	elif global.kero_voice_type == global.CUSTOM_KERO_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.kero_voice_type:
		global.CUSTOM_KERO_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_KERO_VOICE.bananaberry:
			label.text = "Voice:\nKERO UNLEASHED"
		global.CUSTOM_KERO_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_KERO_VOICE.retro:
			label.text = "Voice:\nRETRO"
		global.CUSTOM_KERO_VOICE.esvee:
			label.text = "Voice:\nESVEE"
