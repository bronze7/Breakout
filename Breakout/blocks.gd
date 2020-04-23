extends Node


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
signal block_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_tree().call_group("blocks", "block_emit")

func block_emit():
	emit_signal("block_hit")

func block_hit(body: Node2D, ref: Node2D):
	pass


func _on_blocks_body_entered(body: Node) -> void:
	if(body == get_node("../ball")):
		get_tree().queue_delete(self)
