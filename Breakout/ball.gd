extends KinematicBody2D

var ballSpeed = 100
var direction = Vector2(0, -1)
var ball_pos = Vector2()
var screen_size = Vector2()
var is_playing = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_process(true)
	screen_size = Vector2(240, 300)
	ball_pos.x = get_node("../paddle").paddle_pos.x
	ball_pos.y = get_node("../paddle").paddle_pos.y - 6
	self.position = ball_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(is_playing == false):
		ball_pos.x = get_node("../paddle").paddle_pos.x
		ball_pos.y = get_node("../paddle").paddle_pos.y - 6
		self.position = ball_pos
		#get_node("../paddle").disconnect("body_entered", self, "on_paddle_body_entered")
	if(is_playing == false and Input.is_key_pressed(KEY_SPACE)):
		is_playing = true
		get_parent().generate_blocks()
		#get_node("../paddle").connect("body_entered", self, "on_paddle_body_entered")
	if(is_playing):
		move_ball(delta)
		#get_tree().call_group("blocks", "block_emit")
		#if(ball_pos.y - 2 < 0):
			#direction.y = -direction.y
			#if(direction.x != 0):
				#direction.x = rand_range(-0.5, 0.5)
		#if(ball_pos.x - 2 < 0 or ball_pos.x + 2 > screen_size.x):
			#direction.x = -direction.x
	
func move_ball(delta) -> void:
	#ball_pos -= direction * ballSpeed * delta
	#self.position = ball_pos
	var col = move_and_collide(direction * ballSpeed)
	if col:
		col.normal.bounce(col.remainder)

func _on_paddle_body_entered(body: Node) -> void:
	if(body == get_node("../ball") and is_playing == true):
		direction.x = rand_range(-0.5, 0.5)
		direction.y = -direction.y
		ballSpeed *= 1.05


