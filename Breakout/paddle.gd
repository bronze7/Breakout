extends Area2D

var moveSpeed = 70
var paddle_pos = Vector2()
var screen_size = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = Vector2(240, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	paddle_pos = self.position
	if(Input.is_action_pressed("move_left") and paddle_pos.x > 0):
		paddle_pos.x -= moveSpeed * delta
	if(Input.is_action_pressed("move_right") and paddle_pos.x < screen_size.x):
		paddle_pos.x += moveSpeed * delta
	self.position = paddle_pos
