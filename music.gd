extends AudioStreamPlayer

var current_playing

func _process(_delta):
	if playing == false:
		play_file(current_playing)

func play_file(path):
	current_playing = path
	stream = load(path)
	play()
