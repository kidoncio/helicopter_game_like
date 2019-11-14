extends Node

var is_playing: bool = false
var is_paused: bool = false
var tutorial_is_showed: bool = false

const HIGH_SCORES_FILE_PATH = "res://Game/HighScore.json"

const MAIN_SCENE_PATH = "res://src/Game/Main.tscn"
const MENU_SCENE_PATH = "res://src/Menu/Menu.tscn"

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