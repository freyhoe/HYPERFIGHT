extends Character

var attack_down_jump = 300
var attack_down_gravity = 14
var parried = false

onready var audio2 = get_node("AudioStreamPlayer2")
onready var hitbox_attack_down = get_node("hitbox_attack_down")

onready var proj_attack = preload("res://scenes/proj/goto/attack.tscn")
onready var proj_super = preload("res://scenes/proj/goto/super.tscn")
onready var effect_hit = preload("res://scenes/effect/goto/attack_hit.tscn")
onready var effect_attack = preload("res://scenes/effect/goto/char/attack.tscn")
onready var effect_super = preload("res://scenes/effect/goto/char/super.tscn")

onready var sfx_attack_default = preload("res://audio/sfx/game/char/goto/attack.ogg")
onready var sfx_attack_down_default = preload("res://audio/sfx/game/char/goto/attack_down.ogg")
onready var sfx_special_default = preload("res://audio/sfx/game/char/goto/special.ogg")
onready var sfx_special_parry_default = preload("res://audio/sfx/game/char/goto/special_parry.ogg")
onready var sfx_super_default = preload("res://audio/sfx/game/char/goto/super.ogg")
onready var sfx_hit_default = preload("res://audio/sfx/game/char/goto/hit.ogg")

onready var sfx_attack_banana = preload("res://audio/sfx/game/char/goto_banana/attack.ogg")
onready var sfx_attack_down_banana = preload("res://audio/sfx/game/char/goto_banana/attack_down.ogg")
onready var sfx_special_banana = preload("res://audio/sfx/game/char/goto_banana/special.ogg")
onready var sfx_special_parry_banana = preload("res://audio/sfx/game/char/goto_banana/special_parry.ogg")
onready var sfx_super_banana = preload("res://audio/sfx/game/char/goto_banana/super.ogg")
onready var sfx_hit_banana = preload("res://audio/sfx/game/char/goto_banana/hit.ogg")

onready var sfx_attack_old = preload("res://audio/sfx/game/char/goto/old/attack.ogg")
onready var sfx_attack_down_old = preload("res://audio/sfx/game/char/goto/old/attack_down.ogg")
onready var sfx_super_old = preload("res://audio/sfx/game/char/goto/old/super.ogg")
onready var sfx_hit_old = preload("res://audio/sfx/game/char/goto/old/hit.ogg")

onready var sfx_attack_luc = preload("res://audio/sfx/game/char/goto_luc/attack.ogg")
onready var sfx_attack_down_luc = preload("res://audio/sfx/game/char/goto_luc/attack_down.ogg")
onready var sfx_super_luc = preload("res://audio/sfx/game/char/goto_luc/super.ogg")
onready var sfx_hit_luc = preload("res://audio/sfx/game/char/goto_luc/hit.ogg")
onready var sfx_special_luc = preload("res://audio/sfx/game/char/goto_luc/special.ogg")
onready var sfx_special_parry_luc = preload("res://audio/sfx/game/char/goto_luc/special_parry.ogg")

onready var sfx_attack_retro = preload("res://audio/sfx/game/char/goto_retro/attack.ogg")
onready var sfx_attack_down_retro = preload("res://audio/sfx/game/char/goto_retro/attack_down.ogg")
onready var sfx_super_retro = preload("res://audio/sfx/game/char/goto_retro/super.ogg")
onready var sfx_hit_retro = preload("res://audio/sfx/game/char/goto_retro/hit.ogg")
onready var sfx_special_retro = preload("res://audio/sfx/game/char/goto_retro/special.ogg")
onready var sfx_special_parry_retro = preload("res://audio/sfx/game/char/goto_retro/special_parry.ogg")

onready var sfx_silence = preload("res://audio/sfx/Silence.ogg")

onready var sfx_attack = sfx_attack_default
onready var sfx_attack_down = sfx_attack_down_default
onready var sfx_special = sfx_special_default
onready var sfx_special_parry = sfx_special_parry_default
onready var sfx_super = sfx_super_default
onready var sfx_hit = sfx_hit_default

func _ready():
	match global.goto_voice_type:
		global.CUSTOM_GOTO_VOICE.default:
			sfx_attack = sfx_attack
			sfx_attack_down = sfx_attack_down
			sfx_special = sfx_special
			sfx_special_parry = sfx_special_parry 
			sfx_super = sfx_super
			sfx_hit = sfx_hit
		global.CUSTOM_GOTO_VOICE.bananaberry:
			sfx_attack = sfx_attack_banana
			sfx_attack_down = sfx_attack_down_banana
			sfx_special = sfx_special_banana
			sfx_special_parry = sfx_special_parry_banana
			sfx_super = sfx_super_banana
			sfx_hit = sfx_hit_banana
		global.CUSTOM_GOTO_VOICE.none:
			sfx_attack = sfx_silence
			sfx_attack_down = sfx_silence
			sfx_special = sfx_silence
			sfx_special_parry = sfx_silence
			sfx_super = sfx_silence
			sfx_hit = sfx_silence
		global.CUSTOM_GOTO_VOICE.luc:
			sfx_attack = sfx_attack_luc
			sfx_attack_down = sfx_attack_down_luc
			sfx_special = sfx_special_luc
			sfx_special_parry = sfx_special_parry_luc
			sfx_super = sfx_super_luc
			sfx_hit = sfx_hit_luc
		global.CUSTOM_GOTO_VOICE.old:
			sfx_attack = sfx_attack_old
			sfx_attack_down = sfx_attack_down_old
			sfx_special = sfx_special
			sfx_special_parry = sfx_special_parry 
			sfx_super = sfx_super_old
			sfx_hit = sfx_hit_old
		global.CUSTOM_GOTO_VOICE.retro:
			sfx_attack = sfx_attack_retro
			sfx_attack_down = sfx_attack_down_retro
			sfx_special = sfx_special_retro
			sfx_special_parry = sfx_special_parry_retro
			sfx_super = sfx_super_retro
			sfx_hit = sfx_hit_retro
	
	if global.mode == global.MODE.arcade and global.arcade_stage == global.max_arcade_stage and player_num == 2:
		walk_speed = 90
		air_speed = 160
	shadow_offset = 1

func attack():
	attacked = false
	if check_player_input(global.INPUT_ACTION_DOWN):
		linear_vel.x = special_move * sprite.scale.x
		linear_vel.y = 0
		move_while_attacking = false
		play_anim_this_frame("attack_down")
		if is_april_fools:
			play_audio(sfx_attack_down_old)
		else:
			play_audio(sfx_attack_down)
	else:
		linear_vel.x *= 0.25
		linear_vel.y = 0
		play_anim_this_frame("attack")
		if is_april_fools:
			play_audio(sfx_attack_old)
		else:
			play_audio(sfx_attack)

func special():
	.special()
	parried = false
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
	play_anim_this_frame("super")
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
	parrying = (anim_player.current_animation == "special" and not parried)
	invincible = (anim_player.current_animation == "special" and parried)
	
	move_while_attacking = false
	attack_while_attacking = false
	dash_while_attacking = false
	if attacking:
		if anim_player.current_animation == "special":
			if parried:
				move_while_attacking = true
				attack_while_attacking = true
				dash_while_attacking = true
			else:
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
				
				process_own_hitbox(hitbox_attack_down, Vector2(75 * sprite.scale.x, -325), effect_hit)
			else:
				if on_floor:
					linear_vel.x = 0
					linear_vel.y = 0
				else:
					linear_vel.y = attack_gravity
				if not attacked and sprite.frame >= 1:
					var p
					var e
					if anim_player.current_animation == "super":
						p = proj_super
						e = effect_super
					else:
						p = proj_attack
						e = effect_attack
					
					p = create_projectile(p, Vector2(15 * sprite.scale.x, 0))
					p.sprite.scale.x = sprite.scale.x
					if check_player_input(global.INPUT_ACTION_UP):
						p.set_vert_speed(-30)
					if check_player_input(global.INPUT_ACTION_DOWN):
						p.set_vert_speed(30)
					p.set_rot()
					
					e = create_effect(e, Vector2(25 * sprite.scale.x, 0))
					e.scale.x = sprite.scale.x
					e.rotation = p.sprite.rotation
					
					attacked = true

func parry(parry_effect_pos = Vector2()):
	.parry(Vector2(10 * sprite.scale.x, 0))
	parried = true
	parrying = false
	invincible = true
	play_anim_this_frame("special")
	play_audio_custom(audio2, sfx_parry)
	if is_april_fools:
		play_audio(sfx_hit_old)
	else:
		play_audio(sfx_special_parry)

func can_kill(other_num):
	return .can_kill(other_num) and anim_player.current_animation != "special"
