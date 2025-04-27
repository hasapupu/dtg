class_name player extends CharacterBody2D

var inpNameArr := ["left","right","down","up",]
var appliedForces := Vector2(0,0)
var moveDir := Vector2.ZERO
var speed = 200
@onready var anim := get_node("AnimationPlayer") 
@onready var tpAnim := get_node("AnimationPlayer2")

func getInput():
	moveDir = Input.get_vector("left","right","up","down") * speed
	if Input.is_action_just_pressed("tp"):
		tpAnim.play("tp/tp")

func _physics_process(_delta):
	getInput()
	velocity = moveDir + appliedForces
	move_and_slide()

func _process(_delta):
	for i in inpNameArr:
		if Input.is_action_just_pressed(i):
			anim.play(i)				
		if Input.is_anything_pressed() == false:
			anim.play("idle")

		

func teleport(target: Vector2):
	position += target

func _on_animation_finished(animName):
	if animName == "tp/tp":
		teleport(moveDir/8)
		tpAnim.play("tp/tpOut")
