extends UiMenuButton

func setting_slide_left():
	if global.goto_voice_type > global.CUSTOM_GOTO_VOICE.default:
		global.goto_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.goto_voice_type < global.CUSTOM_GOTO_VOICE.none:
		global.goto_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.goto_voice_type == global.CUSTOM_GOTO_VOICE.none:
		frame = 3
	elif global.goto_voice_type == global.CUSTOM_GOTO_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.goto_voice_type:
		global.CUSTOM_GOTO_VOICE.default:
			label.text = "Voice:\nDefault"
		global.CUSTOM_GOTO_VOICE.bananaberry:
			label.text = "Voice:\nShoto Go To"
		global.CUSTOM_GOTO_VOICE.none:
			label.text = "Voice:\nNone"
		global.CUSTOM_GOTO_VOICE.luc:
			label.text = "Voice:\nTTS"
		global.CUSTOM_GOTO_VOICE.fez3:
			label.text = "Voice:\nREVERSE"
		global.CUSTOM_GOTO_VOICE.retro:
			label.text = "Voice:\nRETRO"
		global.CUSTOM_GOTO_VOICE.old:
			label.text = "Voice:\nOld"
