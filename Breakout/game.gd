extends Node2D


var cur_pos = Vector2()
var next_pos = Vector2()
var block
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	block = load("res://blocks.tscn")
	cur_pos = Vector2(12, 4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_blocks():
	for i in range(1, 30):
		if(i <= 9):
			var red = block.instance()
			red.position = cur_pos
			red.scale = Vector2(2, 2)
			add_child(red)
			red.connect("block_hit", self, "on_block_hit")
			red.add_to_group("blocks")
			next_pos.x = cur_pos.x + 27
			next_pos.y = cur_pos.y
			cur_pos = next_pos
	
