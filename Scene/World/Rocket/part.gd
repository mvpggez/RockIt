extends Spatial

export var visible_name = "Unnamed" #Name of the Part that is used in the shop
export var price = 0 #Price of the part that is used in the shop
export (Resource) var mesh_resource = null #Resource with mesh, used for the part
export (Vector3) var mesh_offset = null #Offset added to transform of the mesh_resource
export var mesh_height = 0.0 #Height, used to determine position of other parts

