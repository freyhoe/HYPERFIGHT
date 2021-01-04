extends UiMenuButton

func setting_slide_left():
	if global.darkgoto_voice_type > global.CUSTOM_DARKGOTO_VOICE.default:
		global.darkgoto_voice_type -= 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.darkgoto_voice_type < global.CUSTOM_DARKGOTO_VOICE.none:
		global.darkgoto_voice_type += 1
		global.set_voice_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.darkgoto_voice_type == global.CUSTOM_DARKGOTO_VOICE.none:
		frame = 3
	elif global.darkgoto_voice_type == global.CUSTOM_DARKGOTO_VOICE.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.darkgoto_voice_type:
		global.CUSTOM_DARKGOTO_VOICE.default:
			label.text = "Voice:\nDEFAULT"
		global.CUSTOM_DARKGOTO_VOICE.basher:
			label.text = "Voice:\nBASHER"
		global.CUSTOM_DARKGOTO_VOICE.old:
			label.text = "Voice:\nOLD"
		global.CUSTOM_DARKGOTO_VOICE.none:
			label.text = "Voice:\nNONE"
		global.CUSTOM_DARKGOTO_VOICE.retro:
			label.text = "Voice:\nRETRO"
		global.CUSTOM_DARKGOTO_VOICE.bananaberry:
			label.text = "Voice:\nDARK SHOTO GO TO"
