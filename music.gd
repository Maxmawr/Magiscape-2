extends AudioStreamPlayer

func play_file(path):
	stream = load(path)
	play()
