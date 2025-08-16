extends HBoxContainer

signal on_failure

func _ready() -> void:
  for heart in Global.max_hearts:
    var hearts_texture = load("res://scenes/heart_texture.tscn").instantiate()
    hearts_texture.expand_mode = 3
    add_child(hearts_texture)
  
func on_take_damage() -> void:
  Global.current_hearts -= 1
  get_child(-1).queue_free()
  
  if Global.current_hearts <= 0:
    on_failure.emit()
