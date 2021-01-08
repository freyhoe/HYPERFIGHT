extends UiMenuButton

func setting_slide_left():
	if global.goto_music_type > global.CUSTOM_GOTO_MUSIC.default:
		global.goto_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.goto_music_type < global.CUSTOM_GOTO_MUSIC.none:
		global.goto_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.goto_music_type == global.CUSTOM_GOTO_MUSIC.none:
		frame = 3
	elif global.goto_music_type == global.CUSTOM_GOTO_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.goto_music_type:
		global.CUSTOM_GOTO_MUSIC.default:
			label.text = "Dojo: Default"
		global.CUSTOM_GOTO_MUSIC.fez:
			label.text = "Dojo: Sheep"
		global.CUSTOM_GOTO_MUSIC.none:
			label.text = "Dojo: None"
