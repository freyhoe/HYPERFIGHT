extends UiMenuButton

func setting_slide_left():
	if global.time_music_type > global.CUSTOM_TIME_MUSIC.default:
		global.time_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.time_music_type < global.CUSTOM_TIME_MUSIC.none:
		global.time_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.time_music_type == global.CUSTOM_TIME_MUSIC.none:
		frame = 3
	elif global.time_music_type == global.CUSTOM_TIME_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.time_music_type:
		global.CUSTOM_TIME_MUSIC.default:
			label.text = "Company: Default"
		global.CUSTOM_TIME_MUSIC.none:
			label.text = "Company: None"
		global.CUSTOM_TIME_MUSIC.fez:
			label.text = "Company: Sheep"
