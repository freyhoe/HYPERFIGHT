extends UiMenuButton

func setting_slide_left():
	if global.darkgoto_music_type > global.CUSTOM_DARKGOTO_MUSIC.default:
		global.darkgoto_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.darkgoto_music_type < global.CUSTOM_DARKGOTO_MUSIC.none:
		global.darkgoto_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.darkgoto_music_type == global.CUSTOM_DARKGOTO_MUSIC.none:
		frame = 3
	elif global.darkgoto_music_type == global.CUSTOM_DARKGOTO_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.darkgoto_music_type:
		global.CUSTOM_DARKGOTO_MUSIC.default:
			label.text = "Blackhole: Default"
		global.CUSTOM_DARKGOTO_MUSIC.fez:
			label.text = "Blackhole: Sheep"
		global.CUSTOM_DARKGOTO_MUSIC.none:
			label.text = "Blackhole: None"
