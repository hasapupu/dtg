class_name player extends CharacterBody2D

var appliedForces := Vector2(0,0)
var moveDir := Vector2.ZERO
var speed = 200

func getInput():
	moveDir = Input.get_vector("left","right","up","down") * speed

func _physics_process(_delta):
	getInput()
	velocity = moveDir + appliedForces
	move_and_slide()
