extends Spatial

var maximum_height = 0.0

export var finish_height = 1000


export (PoolVector2Array) var money_ranges = PoolVector2Array()	#x is money/height, y is min_height, must be in descending order

var over = false

func _physics_process(delta):
	if not over:
		maximum_height = max(maximum_height, $Rocket.get_height())
		if $Rocket.get_velocity().y < -30:
			failed()
		
		if $Rocket.get_height() >= finish_height:
			win()
	

func calculate_reward(height):
	var money = 0
	money_ranges.invert()
	for r in money_ranges:
		if height > r.y:
			money += r.x*(height-r.y)
			height = r.y
	return money

func failed():
	over = true
	var money = calculate_reward(maximum_height)
	get_parent().add_money(money)
	get_parent().fail(money, maximum_height)
	
func win():
	over = true
	var money = calculate_reward(1000)
	get_parent().add_money(money)
	get_parent().win(money)