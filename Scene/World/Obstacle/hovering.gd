extends RigidBody

func _integrate_forces(state):
	add_central_force(self.transform.basis.xform(Vector3(0,9.81,0))) 