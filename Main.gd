extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Engine.get_frames_per_second())
	var time = Time.get_datetime_dict_from_system()
	$Second.text = str(time["second"]).pad_zeros(2)
	$Minute.text = str(time["minute"]).pad_zeros(2)
	$Hour.text = str(time["hour"]).pad_zeros(2)
	
	$MinuteHand.rotation = PI * (time["minute"]+45) / 30 + PI * time["second"] / 1800
	$HourHand.rotation = PI * (time["hour"] % 12 + 9) / 6 + PI * time["minute"] / 360 + PI * time["second"] / 43200
