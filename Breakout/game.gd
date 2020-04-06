extends Node2D


var cur_pos = Vector2()
var next_pos = Vector2()
var red_block
var yellow_block
var blue_block
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	red_block = load("res://red_block.tscn")
	yellow_block = load("res://yellow_block.tscn")
	blue_block = load("res://blue_block.tscn")
	cur_pos = Vector2(3, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(get_node("ball").is_playing == true):
		generate_blocks()
	
func generate_blocks():
	#var i = 1
	for i in range(1, 30):
		if(i <= 10):
			var red = red_block.instance()
			red.position = cur_pos
			red.scale = Vector2(2, 2)
			add_child(red)
			next_pos.x = cur_pos.x + 6
			cur_pos = next_pos
		
	
