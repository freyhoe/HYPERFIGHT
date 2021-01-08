extends Character

var teleported = false
var teleport_move = 60
var buffed = false
var buffs = 0
var buff_add = 1
var max_buffs = 1
var attack_move = 100
var attack_down_jump = 400
var attack_down_move = 12
var attack_down_move_buffed = 16

onready var anim_player2 = get_node("AnimationPlayer2")
onready var audio2 = get_node("AudioStreamPlayer2")
onready var hitbox_attack = get_node("hitbox_attack")
onready var hitbox_attack_down = get_node("hitbox_attack_down")
onready var effect_buffed = get_node("effect_buffed")
onready var phantom = get_node("phantom")
onready var front = get_node("teleports/indicator_right")
onready var teleports = get_node("teleports")

onready var effect_hit = preload("res://scenes/effect/sword/hit.tscn")
onready var illusion = preload("res://scenes/effect/sword/char/illusion.tscn")
onready var proj_special_trail = preload("res://scenes/proj/sword/special_trail.tscn")
onready var proj_super_trail = preload("res://scenes/proj/sword/super_trail.tscn")

onready var sfx_attack_default = preload("res://audio/sfx/game/char/sword/attack.ogg")
onready var sfx_attack_charge_default = preload("res://audio/sfx/game/char/sword/attack_charge.ogg")
onready var sfx_attack_buffed_default = preload("res://audio/sfx/game/char/sword/attack_buffed.ogg")
onready var sfx_attack_down_default = preload("res://audio/sfx/game/char/sword/attack_down.ogg")
onready var sfx_attack_down_buffed_default = preload("res://audio/sfx/game/char/sword/attack_down_buffed.ogg")
onready var sfx_special_default = preload("res://audio/sfx/game/char/sword/special.ogg")
onready var sfx_super_default = preload("res://audio/sfx/game/char/sword/super.ogg")
onready var sfx_hit_default = preload("res://audio/sfx/game/char/sword/hit.ogg")

onready var sfx_attack_petris = preload("res://audio/sfx/game/char/sword_petris/attack.ogg")
onready var sfx_attack_charge_petris = preload("res://audio/sfx/game/char/sword_petris/attack_charge.ogg")
onready var sfx_attack_buffed_petris = preload("res://audio/sfx/game/char/sword_petris/attack_buffed.ogg")
onready var sfx_attack_down_petris = preload("res://audio/sfx/game/char/sword_petris/attack_down.ogg")
onready var sfx_attack_down_buffed_petris = preload("res://audio/sfx/game/char/sword_petris/attack_down_buffed.ogg")
onready var sfx_special_petris = preload("res://audio/sfx/game/char/sword_petris/special.ogg")
onready var sfx_super_petris = preload("res://audio/sfx/game/char/sword_petris/super.ogg")
onready var sfx_hit_petris = preload("res://audio/sfx/game/char/sword_petris/hit.ogg")

onready var sfx_attack_retro = preload("res://audio/sfx/game/char/sword_retro/attack.ogg")
onready var sfx_attack_charge_retro = preload("res://audio/sfx/game/char/sword_retro/attack_charge.ogg")
onready var sfx_attack_buffed_retro = preload("res://audio/sfx/game/char/sword_retro/attack_buffed.ogg")
onready var sfx_attack_down_retro = preload("res://audio/sfx/game/char/sword_retro/attack_down.ogg")
onready var sfx_attack_down_buffed_retro = preload("res://audio/sfx/game/char/sword_retro/attack_down_buffed.ogg")
onready var sfx_special_retro = preload("res://audio/sfx/game/char/sword_retro/special.ogg")
onready var sfx_super_retro = preload("res://audio/sfx/game/char/sword_retro/super.ogg")
onready var sfx_hit_retro = preload("res://audio/sfx/game/char/sword_retro/hit.ogg")

var sfx_attack
var sfx_attack_down 
var sfx_attack_charge 
var sfx_special 
var sfx_attack_buffed
var sfx_attack_down_buffed = sfx_attack_down_buffed_default
var sfx_super 
var sfx_hit

onready var sfx_silence = preload("res://audio/sfx/Silence.ogg")

func _ready():
	sfx_attack = sfx_attack_default
	sfx_attack_down = sfx_attack_down_default
	sfx_attack_charge = sfx_attack_charge_default
	sfx_special = sfx_special_default
	sfx_attack_buffed = sfx_attack_buffed_default
	sfx_attack_down_buffed = sfx_attack_down_buffed_default
	sfx_super = sfx_super_default
	sfx_hit = sfx_hit_default
	match global.sword_voice_type:
		global.CUSTOM_SWORD_VOICE.petris:
			sfx_attack = sfx_attack_petris
			sfx_attack_charge = sfx_attack_charge_petris
			sfx_attack_buffed =  sfx_attack_buffed_petris
			sfx_attack_down = sfx_attack_down_petris
			sfx_attack_down_buffed =sfx_attack_down_buffed_petris
			sfx_special = sfx_special_petris
			sfx_super =sfx_super_petris
			sfx_hit = sfx_hit_petris
		global.CUSTOM_SWORD_VOICE.none:
			sfx_attack = sfx_silence
			sfx_attack_charge =sfx_silence
			sfx_attack_buffed = sfx_silence
			sfx_attack_down = sfx_silence
			sfx_attack_down_buffed =sfx_silence
			sfx_special = sfx_silence
			sfx_super =sfx_silence
			sfx_hit = sfx_silence
		global.CUSTOM_SWORD_VOICE.retro:
			sfx_attack = sfx_attack_retro
			sfx_attack_charge = sfx_attack_charge_retro
			sfx_attack_buffed =  sfx_attack_buffed_retro
			sfx_attack_down = sfx_attack_down_retro
			sfx_attack_down_buffed =sfx_attack_down_buffed_retro
			sfx_special = sfx_special_retro
			sfx_super =sfx_super_retro
			sfx_hit = sfx_hit_retro
	match global.sword_skin_type:
		global.CUSTOM_SWORD_SKIN.none:
			sprite.visible = false
			own_shadow.kill()
	shadow_offset = -1
	h_dash_speed = 140
	attack_gravity = 10
	special_pos_relevant = false
	anim_player2.playback_speed = 0
	set_palette_sprite(effect_buffed)
	set_palette_sprite(phantom)

func reset_pos(new_pos):
	.reset_pos(new_pos)
	buffed = false
	buffs = 0
	effect_buffed.visible = false
	phantom.visible = false

func attack():
	attacked = false
	if check_player_input(global.INPUT_ACTION_DOWN) and on_floor:
		play_anim_this_frame("attack_down_start")
		if buffed:
			play_audio(sfx_attack_down)
		else:
			play_audio(sfx_attack_down)
	else:
		play_anim_this_frame("attack_charge")
		phantom.offset.x = 0

func special():
	.special()
	linear_vel.x = 0
	linear_vel.y = 0
	play_anim_this_frame("special")
	play_audio(sfx_special)

func super():
	.super()
	attacked = false
	if buffed:
		buffs -= 1
		if buffs <= 0:
			buffed = false
		play_anim_this_frame("super_buffed")
		create_super_flash(Vector2(18 * sprite.scale.x, 0))
	else:
		play_anim_this_frame("super")
		create_super_flash(Vector2(0, -28))
	linear_vel.x *= 0.25
	play_audio(sfx_super)

func kill(knockback):
	.kill(knockback)
	play_audio(sfx_hit)

func process_attack():
	invincible = anim_player.current_animation == "special"
	effect_buffed.visible = buffed and not dead
	effect_buffed.scale.x = sprite.scale.x
	anim_player2.seek(anim_player2.current_animation_position + 1, true)
	phantom.visible = false
	teleports.visible = false
	
	if attacking:
		if anim_player.current_animation == "special":
			if sprite.frame >= 4:
				buffs += buff_add
				if buffs > max_buffs:
					buffs = max_buffs
				buffed = true
		else:
			if on_floor:
				if not attacked:
					linear_vel.x = 0
				else:
					linear_vel.x *= 0.9
				linear_vel.y = 0
				if anim_player.current_animation == "attack_down" or anim_player.current_animation == "attack_down_buffed":
					play_anim_this_frame("attack_down_end")
			else:
				linear_vel.x *= 0.95
				if anim_player.current_animation == "attack_down":
					if check_player_input(global.INPUT_ACTION_LEFT):
						linear_vel.x -= attack_down_move
					if check_player_input(global.INPUT_ACTION_RIGHT):
						linear_vel.x += attack_down_move
					linear_vel.y += attack_gravity * 2
				elif anim_player.current_animation == "attack_down_buffed":
					if check_player_input(global.INPUT_ACTION_LEFT):
						linear_vel.x -= attack_down_move_buffed
					if check_player_input(global.INPUT_ACTION_RIGHT):
						linear_vel.x += attack_down_move_buffed
					linear_vel.y += attack_gravity * 2
				elif not (anim_player.current_animation == "attack" and sprite.frame <= 2):
					linear_vel.y += attack_gravity
				else:
					linear_vel.y = 0
			if not attacked and anim_player.current_animation == "attack_charge":
				if buffed:
					front.visible = false
					phantom.visible = true
					phantom.texture = sprite.texture
					phantom.hframes = sprite.hframes
					phantom.frame = sprite.frame
					phantom.scale.x = sprite.scale.x
					phantom.offset.x += 4
				else:
					front.visible = true
				
				teleports.scale.x = sprite.scale.x
				for i in teleports.get_children():
					i.texture = sprite.texture
					i.hframes = sprite.hframes
					i.frame = sprite.frame
					
			#		i.offset.x += 4
				
				if not teleported:
		#			teleports.visible = true
					teleported = true
					var before_pos = position
					if check_player_just_input(global.INPUT_ACTION_LEFT):
						position.x -= teleport_move
					elif check_player_just_input(global.INPUT_ACTION_RIGHT):
						position.x += teleport_move
					elif check_player_just_input(global.INPUT_ACTION_UP):
						position.y -= teleport_move
					elif check_player_just_input(global.INPUT_ACTION_DOWN) and not on_floor:
						position.y += teleport_move
						if position.y > 47:
							position.y = 47
					else:
						teleported = false
					if teleported:
						teleports.visible = false
						create_inner_illusion(before_pos - position)
						create_outer_illusion(Vector2.ZERO)
				if sprite.frame >= 3 and not check_player_input(global.INPUT_ACTION_ATTACK):
					if buffed:
						create_inner_illusion(Vector2.ZERO)
						linear_vel.x = 0
						var length = (30 + 20 * (sprite.frame - 3)) * sprite.scale.x
						var p = create_projectile(proj_special_trail, Vector2(0, 3))
						p.set_length(length)
						position.x += length
						
						create_outer_illusion(Vector2.ZERO)
						phantom.visible = false
						teleports.visible = false
						linear_vel.x += 200 * sprite.scale.x
						buffs -= 1
						if buffs <= 0:
							buffed = false
						play_audio(sfx_attack_buffed)
					else:
						linear_vel.x += (100 + 100 * (sprite.frame - 3)) * sprite.scale.x
						play_audio(sfx_attack)
					play_anim_this_frame("attack")
					attacked = true
			elif not attacked and (anim_player.current_animation == "super" or anim_player.current_animation == "super_buffed"):
				if sprite.frame >= 4:
					var p = create_projectile(proj_super_trail, Vector2(0, 3))
					p.set_length(256 * sprite.scale.x)
					if anim_player.current_animation == "super":
						p.set_vertical(true, proj_super_trail)
					attacked = true
			elif sprite.frame <= 1 and anim_player.current_animation == "attack":
				create_afterimage()
			
			var knockback = Vector2(50 * sprite.scale.x, -250)
			if anim_player.current_animation == "attack":
				process_own_hitbox(hitbox_attack, knockback, effect_hit, Vector2(sprite.scale.x * 32, 3))
			elif anim_player.current_animation == "attack_down" or anim_player.current_animation == "attack_down_buffed":
				process_own_hitbox(hitbox_attack_down, knockback, effect_hit)
	else:
		teleported = false

func create_inner_illusion(pos):
	for x in range(2):
		var e = create_effect(illusion, pos)
		e.texture = sprite.texture
		e.hframes = sprite.hframes
		e.frame = sprite.frame
		e.scale.x = sprite.scale.x
		e.alpha = 1
		e.left = bool(x)

func create_outer_illusion(pos):
	for x in range(2):
		var e = create_effect(illusion, pos)
		e.position.x -= 25 - (x * 50)
		e.texture = sprite.texture
		e.hframes = sprite.hframes
		e.frame = sprite.frame
		e.scale.x = sprite.scale.x
		e.alpha = 1
		e.left = bool(x)

func on_anim_finished(anim_name):
	if attacking:
		if anim_name == "attack_down_start":
			if buffed:
				play_anim_this_frame("attack_down_buffed")
				buffs -= 1
				if buffs <= 0:
					buffed = false
			else:
				play_anim_this_frame("attack_down")
			position.y -= 4
			linear_vel.y -= attack_down_jump
			on_floor = false
			attacked = true
		elif anim_name == "attack_charge":
			linear_vel.x += attack_move * sprite.scale.x
			attacked = true
			play_anim_this_frame("attack")
		else:
			linear_vel.x = 0
			attacking = false
			play_anim_this_frame("idle")

func can_destroy_other(other_num):
	if player_num != other_num and anim_player.current_animation == "attack_down_buffed":
		return true
	return false
