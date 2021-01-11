extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	visible = false
	if randf()>0.94:
		visible = true
	$AnimationPlayer.play("walk")

func _process(_delta):
	position.x+=1
