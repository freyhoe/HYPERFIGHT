extends UiMenuButton

func setting_slide_left():
	if global.announcer_type > global.ANNOUNCER.default:
		global.announcer_type -= 1
		global.set_announcer_type()
	set_label_text()
	check_slide_edges()

func setting_slide_right():
	if global.announcer_type < global.ANNOUNCER.none:
		global.announcer_type += 1
		global.set_announcer_type()
	set_label_text()
	check_slide_edges()

func check_slide_edges():
	if global.announcer_type == global.ANNOUNCER.none:
		frame = 3
	elif global.announcer_type == global.ANNOUNCER.default:
		frame = 2
	else:
		frame = 1

func set_label_text():
	match global.announcer_type:
		global.ANNOUNCER.default:
			label.text = "Announcer:\nDEFAULT"
		global.ANNOUNCER.bananaberry:
			label.text = "Announcer:\nBANANABERRY"
		global.ANNOUNCER.none:
			label.text = "Announcer:\nNONE"
		global.ANNOUNCER.skreamnredskull:
			label.text = "Announcer:\nSKREAMNREDSKULL"
		global.ANNOUNCER.vernomere:
			label.text = "Announcer:\nVERNO"
		global.ANNOUNCER.retro:
			label.text = "Announcer:\nRETRO"
