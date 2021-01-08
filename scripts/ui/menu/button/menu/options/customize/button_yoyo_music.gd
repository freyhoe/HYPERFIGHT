extends UiMenuButton

func setting_slide_left():
	if global.yoyo_music_type > global.CUSTOM_YOYO_MUSIC.default:
		global.yoyo_music_type -= 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.yoyo_music_type < global.CUSTOM_YOYO_MUSIC.none:
		global.yoyo_music_type += 1
		global.set_music_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.yoyo_music_type == global.CUSTOM_YOYO_MUSIC.none:
		frame = 3
	elif global.yoyo_music_type == global.CUSTOM_YOYO_MUSIC.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.yoyo_music_type:
		global.CUSTOM_YOYO_MUSIC.default:
			label.text = "Rooftop: DEFAULT"
		global.CUSTOM_YOYO_MUSIC.fez:
			label.text = "Rooftop: Sheep"
		global.CUSTOM_YOYO_MUSIC.none:
			label.text = "Rooftop: NONE"

