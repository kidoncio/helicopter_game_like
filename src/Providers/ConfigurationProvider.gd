extends Node

const CONFIGURATION_FILE_PATH = "res://Configuration/Configuration.json"

var configuration: Dictionary = {
	"sound_muted": false
}


func _ready() -> void:
	var data = get_from_json(self.CONFIGURATION_FILE_PATH)
	
	if data:
		configuration = data
	
	update_sound()


func reset() -> void:
	configuration.sound_muted = false
	
	return


func get_from_json(filename: String):
	var file = File.new()
	
	file.open(filename, File.READ)
	
	var text: String = file.get_as_text()
	var parse: JSONParseResult = JSON.parse(text)
	var data = parse.result
	
	file.close()
	
	return data


func update_configuration_file() -> void:
	var file = File.new()
	
	if file.open(self.CONFIGURATION_FILE_PATH, File.WRITE) != 0:
		print("Error opening file")
		
		return
	
	var configurationJSON = to_json(configuration)
	
	if not validate_json(configurationJSON):
		return
	
	file.store_line(configurationJSON)
	file.close()
	
	return


func toggle_sound_muted() -> void:
	configuration.sound_muted = !configuration.sound_muted
	
	update_sound()


func update_sound() -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), configuration.sound_muted)
	
	self.update_configuration_file()