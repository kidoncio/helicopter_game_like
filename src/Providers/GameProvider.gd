extends Node

var is_playing: bool = false

const HIGH_SCORES_FILE_PATH = "res://Game/HighScore.json"

var high_scores: Dictionary = {}

func _ready() -> void:
	var data = ConfigurationProvider.get_from_json(self.HIGH_SCORES_FILE_PATH)
	
	if data:
		high_scores = data


func save_score(score) -> void:
	var file = File.new()
	
	if not file.file_exists(self.HIGH_SCORES_FILE_PATH):
		return
	
	file.open(self.HIGH_SCORES_FILE_PATH, File.WRITE)
	file.store_line(to_json(score))
	file.close()
	
	return