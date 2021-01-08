extends UiMenuButton

func setting_slide_left():
	if global.sword_music_type > global.CUSTOM_SWORD_MUSIC.default:
		global.sword_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.sword_music_type < global.CUSTOM_SWORD_MUSIC.none:
		global.sword_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.sword_music_type == global.CUSTOM_SWORD_MUSIC.none:
		frame = 3
	elif global.sword_music_type == global.CUSTOM_SWORD_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.sword_music_type:
		global.CUSTOM_SWORD_MUSIC.default:
			label.text = "Bridge: Default"
		global.CUSTOM_SWORD_MUSIC.fez:
			label.text = "Bridge: Sheep"
		global.CUSTOM_SWORD_MUSIC.none:
			label.text = "Bridge: None"
