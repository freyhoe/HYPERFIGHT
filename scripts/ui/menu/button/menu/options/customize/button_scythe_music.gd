extends UiMenuButton

func setting_slide_left():
	if global.scythe_music_type > global.CUSTOM_SCYTHE_MUSIC.default:
		global.scythe_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.scythe_music_type < global.CUSTOM_SCYTHE_MUSIC.none:
		global.scythe_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.scythe_music_type == global.CUSTOM_SCYTHE_MUSIC.none:
		frame = 3
	elif global.scythe_music_type == global.CUSTOM_SCYTHE_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.scythe_music_type:
		global.CUSTOM_SCYTHE_MUSIC.default:
			label.text = "Sanctuary: Default"
		global.CUSTOM_SCYTHE_MUSIC.none:
			label.text = "Sanctuary: None"
		global.CUSTOM_SCYTHE_MUSIC.fez:
			label.text = "Sanctuary: Sheep"
