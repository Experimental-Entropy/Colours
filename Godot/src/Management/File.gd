extends Node
class_name Manager

func unpack(dims: Vector2, path_to_unpack: String) -> Array:
	
	var file = File.new()
	file.open(file, file.READ)
	
	var block_map = []
	for i in range(dims[0]):
		block_map.append([])
		for x in range(dims[1]):
			block_map[i].append(0)
	
	var line_number = 1
	while not file.eof_reached():
		
		var line = file.get_line()
		line += " "
		
		if line[0] != "#":
			
			var type = ""
			if line[0] == "B":
				type = "Block"
			elif line[0] == "G":
				type = "Goal"
			elif line[0] == "C":
				type = "Conveyor"
			elif line[0] == "I":
				type = "Input"
			elif line[0] == "O":
				type = "Output"
			elif line[0] == "L":
				type = "Linked"
			else:
				print_debug("Item Type not as expected in line: " + str(line_number) + " - " + line)
			
			var property = ""
			if type != "Output":
				property = line[2]
			
			var coords = Vector2(0,0)
			if type == "Output":
				coords.x = int(line.substr(2,2))
				coords.y = int(line.substr(4,2))
			else:
				coords.x = int(line.substr(2,2))
				coords.y = int(line.substr(4,2))
		
		
		line_number += 1
	
	return block_map
