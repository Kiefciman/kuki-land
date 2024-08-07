extends Node

var json = JSON.new()
var path = 'user://save.json'

func WriteSave(content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	file.close()
	file = null
	
func LoadSave():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	return content
	
func CheckSaveFile():
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		return false
	else:
		return true
