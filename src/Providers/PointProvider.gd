extends Node

const POINTS_FILE_PATH = "res://Configuration/Points.json"

var points: int = 0

func save_game() -> void:
    var save_game = File.new()
    save_game.open(self.POINTS_FILE_PATH, File.WRITE)
	
    var save = {
		"points": self.points
	}
	
    save_game.store_line(to_json(save))
	
    save_game.close()


func load_game() -> void:
	var data = ConfigurationProvider.get_from_json(self.POINTS_FILE_PATH)
	
	if not data:
		return
	
	self.points = data.points 