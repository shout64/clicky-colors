extends Button



func _on_pressed() -> void:
  Global.current_score += 1
  if Global.high_score < Global.current_score:
    Global.high_score = Global.current_score
  
  queue_free()
