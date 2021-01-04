extends UiMenuButton

func setting_slide_left():
	if global.slime_voice_type > global.CUSTOM_SLIME_VOICE.default:
		global.slime_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.slime_voice_type < global.CUSTOM_SLIME_VOICE.none:
		global.slime_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.slime_voice_type == global.CUSTOM_SLIME_VOICE.none:
		frame = 3
	elif global.slime_voice_type == global.CUSTOM_SLIME_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.slime_voice_type:
		global.CUSTOM_SLIME_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_SLIME_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_SLIME_VOICE.retro:
			label.text = "Voice:\nRETRO"
