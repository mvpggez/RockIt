extends Camera

export (NodePath) var target = null #Nodepath to the rocket. Needs Rocket-specific functions
export var target_offset = Vector3(0, 5, 0) #Offset to look next to target (e.g. above)
var flying_offset = Vector3(0,3,15) #Offset of the camera
var shake_intensity = 0#.10 #While this value is non-zero, the screen shakes 
var time = 0.0 #total time since start
var standing_offset = Vector3(0, 2.3, 9)
var standing = true
var last_change = 0

func set_standing(stand):
	if standing != stand:
		last_change = time
	standing = stand

func _process(delta):
	time += delta
	if standing:
		if time-last_change<0.25:
			fov = lerp(70, 60, (time-last_change)*4)
		
	else:
		
		if time-last_change<0.25:
			fov = lerp(60, 70, (time-last_change)*4)
		
		var current_target = get_node(target)
		var current_target_position = current_target.get_center()
		var distance = current_target_position - (translation-flying_offset)
		look_at(current_target_position+target_offset, Vector3(0,1,0))
		translation.x += distance.x*0.25
		translation.y += distance.y*0.25
		translation.z += distance.z*0.25
		
		#TODO: set z-distance to target and FOV based on velocity
		#translation.z = current_target.get_velocity().length()
		
		#camerashake
		translate(Vector3(sin(time*70)*shake_intensity, sin(time*30)*shake_intensity, 0.0))