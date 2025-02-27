extends Area2D

export var velocidad=400.0

var mi_pos=Vector2.ZERO

onready var animacion=$Animacion

func _ready():
	global_position = mi_pos
	animacion.play("moverse")

func _process(delta):
	global_position.y += velocidad * delta

func crear(pos):
	mi_pos=pos

func _on_VisibilityNotifier2D_screen_exited():
	destruirse()

func destruirse():
	queue_free()

func _on_body_entered(body):
	if body.name=="Saltarin":
		body.respawn()
	
	destruirse()
