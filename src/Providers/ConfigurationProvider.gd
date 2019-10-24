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
	var data = parse_json(text)
	
	file.close()
	
	return data


func update_configuration_file(newConfiguration = null) -> void:
	if newConfiguration:
		configuration = newConfiguration
	
	var file = File.new()
	
	if not file.file_exists(self.CONFIGURATION_FILE_PATH):
		return
	
	file.open(self.CONFIGURATION_FILE_PATH, File.WRITE)
	file.store_line(to_json(configuration))
	file.close()
	
	return


func toggle_sound_muted() -> void:
	configuration.sound_muted = !configuration.sound_muted
	
	update_sound()


func update_sound() -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), configuration.sound_muted)
	self.update_configuration_file()