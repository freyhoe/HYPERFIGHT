extends UiMenuButton

func setting_slide_left():
	if global.sword_voice_type > global.CUSTOM_SWORD_VOICE.default:
		global.sword_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.sword_voice_type < global.CUSTOM_SWORD_VOICE.none:
		global.sword_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.sword_voice_type == global.CUSTOM_SWORD_VOICE.none:
		frame = 3
	elif global.sword_voice_type == global.CUSTOM_SWORD_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.sword_voice_type:
		global.CUSTOM_SWORD_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_SWORD_VOICE.petris:
			label.text = "Voice:\nANIME SWORDSMAN"
		global.CUSTOM_SWORD_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_SWORD_VOICE.retro:
			label.text = "Voice:\nRETRO"
		global.CUSTOM_SWORD_VOICE.fez2:
			label.text = "Voice:\nTTS"
		global.CUSTOM_SWORD_VOICE.fez3:
			label.text = "Voice:\nREVERSE"
