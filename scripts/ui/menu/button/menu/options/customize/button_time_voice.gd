extends UiMenuButton

func setting_slide_left():
	if global.time_voice_type > global.CUSTOM_TIME_VOICE.default:
		global.time_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.time_voice_type < global.CUSTOM_TIME_VOICE.none:
		global.time_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.time_voice_type == global.CUSTOM_TIME_VOICE.none:
		frame = 3
	elif global.time_voice_type == global.CUSTOM_TIME_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.time_voice_type:
		global.CUSTOM_TIME_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_TIME_VOICE.bananaberry:
			label.text = "Voice:\nBRITISH DON"
		global.CUSTOM_TIME_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_TIME_VOICE.fez:
			label.text = "Voice:\nTTS"
		global.CUSTOM_TIME_VOICE.fez3:
			label.text = "Voice:\nREVERSE"
		global.CUSTOM_TIME_VOICE.retro:
			label.text = "Voice:\nRETRO"
