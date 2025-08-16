extends Button

@export var enemy : bool

signal take_damage

func _on_pressed() -> void:
  if enemy == true:
    take_damage.emit()

  else:
    Global.current_score += 1
    if Global.high_score < Global.current_score:
      Global.high_score = Global.current_score
  
  queue_free()
