extends UiMenuButton

func setting_slide_left():
	if global.kero_music_type > global.CUSTOM_KERO_MUSIC.default:
		global.kero_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.kero_music_type < global.CUSTOM_KERO_MUSIC.none:
		global.kero_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.kero_music_type == global.CUSTOM_KERO_MUSIC.none:
		frame = 3
	elif global.kero_music_type == global.CUSTOM_KERO_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.kero_music_type:
		global.CUSTOM_KERO_MUSIC.default:
			label.text = "Lab: default"
		global.CUSTOM_KERO_MUSIC.fez:
			label.text = "Lab: Sheep"
		global.CUSTOM_KERO_MUSIC.none:
			label.text = "Lab: None"
