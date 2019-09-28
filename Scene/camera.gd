extends Camera

export (NodePath) var target = null #Nodepath to the rocket. Needs Rocket-specific functions
export var target_offset = Vector3(0, 10, 0) #Offset to look next to target (e.g. above)
var offset = Vector3(0,0,0) #Offset of the camera, is set to translation on load
var shake_intensity = 0.0 #While this value is non-zero, the screen shakes 
var time = 0.0 #total time since start

func _ready():
	offset = translation

func _process(delta):
	time += delta
	var current_target = get_node(target)
	var current_target_position = current_target.get_center()
	var distance = current_target_position - (translation-offset)
	look_at(current_target_position+target_offset, Vector3(0,1,0))
	translation.x += distance.x*0.3
	translation.y += distance.y*0.3
	#TODO: set z-distance to target and FOV based on velocity
	#translation.z = current_target.get_velocity().length()
	
	#camerashake
	translate(Vector3(sin(time*70)*shake_intensity, sin(time*30)*shake_intensity, 0.0))