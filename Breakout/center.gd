extends Label


var ctr = -0.4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Timer_timeout() -> void:
	if(get_node("../ball").is_playing == false):
		self.visible = !self.visible
	if(get_node("../ball").is_playing == true):
		self.modulate.a += ctr 
	if(self.modulate.a <= 0):
		get_node("Timer").stop()
