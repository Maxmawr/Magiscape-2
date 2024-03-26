extends AudioStreamPlayer

var current_playing = null

func _process(_delta):
	if playing == false and current_playing != null:
		play_file(current_playing)

func play_file(path):
	current_playing = path
	stream = load(path)
	play()
