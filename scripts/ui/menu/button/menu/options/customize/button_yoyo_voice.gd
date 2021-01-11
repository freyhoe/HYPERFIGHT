extends UiMenuButton

func setting_slide_left():
	if global.yoyo_voice_type > global.CUSTOM_YOYO_VOICE.default:
		global.yoyo_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.yoyo_voice_type < global.CUSTOM_YOYO_VOICE.none:
		global.yoyo_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.yoyo_voice_type == global.CUSTOM_YOYO_VOICE.none:
		frame = 3
	elif global.yoyo_voice_type == global.CUSTOM_YOYO_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.yoyo_voice_type:
		global.CUSTOM_YOYO_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_YOYO_VOICE.bananaberry:
			label.text = "Voice:\nSCIENTIFICALLY ACCURATE YO-YONA"
		global.CUSTOM_YOYO_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_YOYO_VOICE.fez2:
			label.text = "Voice:\nTTS"
		global.CUSTOM_YOYO_VOICE.fez3:
			label.text = "Voice:\nREVERSE"
		global.CUSTOM_YOYO_VOICE.retro:
			label.text = "Voice:\nRETRO"
