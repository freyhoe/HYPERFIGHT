extends UiMenuButton

func setting_slide_left():
	if global.slime_music_type > global.CUSTOM_SLIME_MUSIC.default:
		global.slime_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.slime_music_type < global.CUSTOM_SLIME_MUSIC.none:
		global.slime_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.slime_music_type == global.CUSTOM_SLIME_MUSIC.none:
		frame = 3
	elif global.slime_music_type == global.CUSTOM_SLIME_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.slime_music_type:
		global.CUSTOM_SLIME_MUSIC.default:
			label.text = "Factory: Default"
		global.CUSTOM_SLIME_MUSIC.none:
			label.text = "Factory: None"
		global.CUSTOM_SLIME_MUSIC.fez:
			label.text = "Factory: Sheep"
