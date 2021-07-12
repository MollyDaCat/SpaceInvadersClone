extends Timer

func _ready():
	randomize()
	set_wait_time(rand_range(3,7))
	.start()
