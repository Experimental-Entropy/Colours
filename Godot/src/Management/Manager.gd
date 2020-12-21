extends Node
class_name Manager

func setup_blocks(dims: Vector2, path_to_unpack: String) -> Array:
	
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
		var coords: = Vector2(0, 0)
		var comma: = 0
		
		if line[0] != "#":
			
			if line[0] == "C":
				
				if line[4] == ",":
					coords.x = int(line[4])
					comma = 4
				elif line[5] == ",":
					coords.x = int(line[4] + line[5])
					comma = 5
				else:
					print_debug("Warning when importing level file: '" + line + "'")
				
				if line[comma + 2] == " ":
					coords.y = int(line[comma + 1])
				elif line[comma + 3] == " ":
					coords.y = int(line[comma + 1] + line[comma + 2])
				else:
					print_debug("Warning when importing level file: '" + line + "'")
				
			elif line[0] == "M":
				pass
			elif line[0] == "Y":
				pass
			elif line[0] == "R":
				pass
			elif line[0] == "G":
				pass
			elif line[0] == "U":
				pass
			elif line[0] == "W":
				pass
			elif line[0] == "B":
				pass
			else:
				print_debug("Warning when importing level file: " + line)
		
		
		line_number += 1
	
	return []
