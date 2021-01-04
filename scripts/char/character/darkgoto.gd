extends Character

var attack_down_jump = 350
var attack_down_gravity = 16
var extra_dash = true

onready var audio2 = get_node("AudioStreamPlayer2")
onready var hitbox_attack_down = get_node("hitbox_attack_down")

onready var proj_attack = preload("res://scenes/proj/darkgoto/attack.tscn")
onready var proj_super = preload("res://scenes/proj/darkgoto/super.tscn")
onready var effect_hit = preload("res://scenes/effect/darkgoto/attack_hit.tscn")
onready var effect_attack = preload("res://scenes/effect/darkgoto/char/attack.tscn")
onready var effect_super = preload("res://scenes/effect/darkgoto/char/super.tscn")

onready var sfx_attack_default = preload("res://audio/sfx/game/char/darkgoto/attack.ogg")
onready var sfx_attack_down_default = preload("res://audio/sfx/game/char/darkgoto/attack_down.ogg")
onready var sfx_special_default = preload("res://audio/sfx/game/char/darkgoto/special.ogg")
onready var sfx_special_reflect_default = preload("res://audio/sfx/game/char/darkgoto/special_reflect.ogg")
onready var sfx_super_default = preload("res://audio/sfx/game/char/darkgoto/super.ogg")
onready var sfx_hit_default = preload("res://audio/sfx/game/char/darkgoto/hit.ogg")

onready var sfx_attack_basher = preload("res://audio/sfx/game/char/darkgoto_basher/attack.ogg")
onready var sfx_attack_down_basher = preload("res://audio/sfx/game/char/darkgoto_basher/attack_down.ogg")
onready var sfx_special_basher = preload("res://audio/sfx/game/char/darkgoto_basher/special.ogg")
onready var sfx_special_reflect_basher = preload("res://audio/sfx/game/char/darkgoto_basher/special_reflect.ogg")
onready var sfx_super_basher = preload("res://audio/sfx/game/char/darkgoto_basher/super.ogg")
onready var sfx_hit_basher = preload("res://audio/sfx/game/char/darkgoto_basher/hit.ogg")

onready var sfx_attack_banana= preload("res://audio/sfx/game/char/darkgoto_banana/attack.ogg")
onready var sfx_attack_down_banana = preload("res://audio/sfx/game/char/darkgoto_banana/attack_down.ogg")
onready var sfx_special_banana = preload("res://audio/sfx/game/char/darkgoto_banana/special.ogg")
onready var sfx_special_reflect_banana = preload("res://audio/sfx/game/char/darkgoto_banana/special_reflect.ogg")
onready var sfx_super_banana = preload("res://audio/sfx/game/char/darkgoto_banana/super.ogg")
onready var sfx_hit_banana = preload("res://audio/sfx/game/char/darkgoto_banana/hit.ogg")

onready var sfx_attack_retro= preload("res://audio/sfx/game/char/darkgoto_retro/attack.ogg")
onready var sfx_attack_down_retro = preload("res://audio/sfx/game/char/darkgoto_retro/attack_down.ogg")
onready var sfx_special_retro = preload("res://audio/sfx/game/char/darkgoto_retro/special.ogg")
onready var sfx_special_reflect_retro = preload("res://audio/sfx/game/char/darkgoto_retro/special_reflect.ogg")
onready var sfx_super_retro = preload("res://audio/sfx/game/char/darkgoto_retro/super.ogg")
onready var sfx_hit_retro = preload("res://audio/sfx/game/char/darkgoto_retro/hit.ogg")

var sfx_attack = sfx_attack_default
var sfx_attack_down = sfx_attack_down_default
var sfx_special = sfx_special_default
var sfx_special_reflect = sfx_special_reflect_default
var sfx_super = sfx_super_default
var sfx_hit = sfx_hit_default

onready var sfx_attack_old = preload("res://audio/sfx/game/char/darkgoto/old/attack.ogg")
onready var sfx_attack_down_old = preload("res://audio/sfx/game/char/darkgoto/old/attack_down.ogg")
onready var sfx_super_old = preload("res://audio/sfx/game/char/darkgoto/old/super.ogg")
onready var sfx_hit_old = preload("res://audio/sfx/game/char/darkgoto/old/hit.ogg")
onready var sfx_silence = preload("res://audio/sfx/Silence.ogg")

func _ready():
	match global.darkgoto_voice_type:
		global.CUSTOM_DARKGOTO_VOICE.basher:
			sfx_attack = sfx_attack_basher
			sfx_attack_down = sfx_attack_down_basher
			sfx_special = sfx_special_basher
			sfx_special_reflect = sfx_special_reflect_basher
			sfx_super = sfx_super_basher
			sfx_hit = sfx_hit_basher
		global.CUSTOM_DARKGOTO_VOICE.old:
			sfx_attack = sfx_attack_old 
			sfx_attack_down = sfx_attack_down_old 
			sfx_super = sfx_super_old
			sfx_hit = sfx_hit_old
		global.CUSTOM_DARKGOTO_VOICE.none:
			sfx_attack = sfx_silence
			sfx_attack_down = sfx_silence
			sfx_special = sfx_silence
			sfx_special_reflect = sfx_silence
			sfx_super = sfx_silence
			sfx_hit = sfx_silence
		global.CUSTOM_DARKGOTO_VOICE.bananaberry:
			sfx_attack = sfx_attack_banana
			sfx_attack_down = sfx_attack_down_banana
			sfx_special = sfx_special_banana
			sfx_special_reflect = sfx_special_reflect_banana
			sfx_super = sfx_super_banana
			sfx_hit = sfx_hit_banana
		global.CUSTOM_DARKGOTO_VOICE.retro:
			sfx_attack = sfx_attack_retro
			sfx_attack_down = sfx_attack_down_retro
			sfx_special = sfx_special_retro
			sfx_special_reflect = sfx_special_reflect_retro
			sfx_super = sfx_super_retro
			sfx_hit = sfx_hit_retro
	add_to_group(global.GROUP_CAN_REFLECT)
	shadow_offset = 1
	if global.mode == global.MODE.arcade and global.arcade_stage == global.max_arcade_stage and player_num == 2:
		walk_speed = 90
		air_speed = 160
	else:
		walk_speed = 70
		air_speed = 100
	jump = 350
	gravity = 16
	special_move = 120
	h_dash_speed = 150

func attack():
	attacked = false
	if check_player_input(global.INPUT_ACTION_DOWN):
		linear_vel.x = special_move * sprite.scale.x
		linear_vel.y = 0
		play_anim_this_frame("attack_down")
		if is_april_fools:
			play_audio(sfx_attack_down_old)
		else:
			play_audio(sfx_attack_down)
	else:
		linear_vel.x *= 0.25
		linear_vel.y = 0
		if on_floor:
			play_anim_this_frame("attack_upwards")
		else:
			play_anim_this_frame("attack_downwards")
		if is_april_fools:
			play_audio(sfx_attack_old)
		else:
			play_audio(sfx_attack)
	sprite.frame = 0

func special():
	.special()
	if on_floor:
		linear_vel.x = 0
		linear_vel.y = 0
	else:
		linear_vel.x *= 0.25
		linear_vel.y *= 0.25
	play_anim_this_frame("special")
	play_audio(sfx_special)

func super():
	.super()
	attacked = false
	linear_vel.x *= 0.25
	linear_vel.y = 0
	if on_floor:
		play_anim_this_frame("super_upwards")
	else:
		play_anim_this_frame("super_downwards")
	if is_april_fools:
		play_audio(sfx_super_old)
	else:
		play_audio(sfx_super)
	create_super_flash(Vector2(-10 * sprite.scale.x, 0))
	
func kill(knockback):
	.kill(knockback)
	if is_april_fools:
		play_audio(sfx_hit_old)
	else:
		play_audio(sfx_hit)

func process_attack():
	parrying = (anim_player.current_animation == "special")
	invincible = (anim_player.current_animation == "special_reflect")
	
	if on_floor:
		extra_dash = true
	else:
		if not can_dash and not is_dashing() and extra_dash:
			can_dash = true
			extra_dash = false
	
	if attacking:
		if anim_player.current_animation == "special" or anim_player.current_animation == "special_reflect":
			if on_floor:
				linear_vel.x = 0
				linear_vel.y = 0
			else:
				linear_vel.y += attack_gravity
		else:
			if anim_player.current_animation == "attack_down":
				if not attacked:
					if sprite.frame >= 1:
						linear_vel.y = -attack_down_jump
						on_floor = false
						attacked = true
					else:
						linear_vel.y = 0
				else:
					if on_floor:
						linear_vel.x = 0
						linear_vel.y = 0
						if anim_player.current_animation_position < 296:
							anim_player.seek(296, true)
					else:
						linear_vel.y += attack_down_gravity
				
				process_own_hitbox(hitbox_attack_down, Vector2(80 * sprite.scale.x, -350), effect_hit)
			else:
				if on_floor:
					linear_vel.x = 0
					linear_vel.y = 0
				else:
					linear_vel.y = attack_gravity
				if not attacked and sprite.frame >= 1:
					var p
					var e
					var up = anim_player.current_animation == "attack_upwards" or anim_player.current_animation == "super_upwards"
					var y_offset = 10
					if anim_player.current_animation == "super_upwards" or anim_player.current_animation == "super_downwards":
						p = proj_super
						e = effect_super
					else:
						p = proj_attack
						e = effect_attack
					if up:
						y_offset = -y_offset
					
					p = create_projectile(p, Vector2(16 * sprite.scale.x, y_offset))
					p.set_up(sprite.scale.x, up)
					
					e = create_effect(e, Vector2(18 * sprite.scale.x, y_offset))
					e.scale.x = sprite.scale.x
					e.rotation = p.sprite.rotation
					
					attacked = true

func process_anim():
	dash_while_attacking = false
	.process_anim()

func process_attack_anim():
#	if (anim_player.current_animation == "super_upwards" or anim_player.current_animation == "super_downwards") and \
#	   sprite.frame >= 1:
#		dash_while_attacking = true
	return .process_attack_anim()

func parry(parry_effect_pos = Vector2()):
	.parry(Vector2(20 * sprite.scale.x, 0))
	parrying = false
	invincible = true
	play_anim_this_frame("special_reflect")
	play_audio_custom(audio2, sfx_parry)
	if is_april_fools:
		play_audio(sfx_attack_down_old)
	else:
		play_audio(sfx_special_reflect)

func can_kill(other_num):
	return .can_kill(other_num) and anim_player.current_animation != "special"
