extends Button

@export var enemy : bool

func _on_pressed() -> void:
  if enemy == false:
    Global.current_score += 1
    if Global.high_score < Global.current_score:
      Global.high_score = Global.current_score
      
  else:
    Global.current_score -= 1
  
  queue_free()
