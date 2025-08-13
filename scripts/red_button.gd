extends Button



func _on_pressed() -> void:
  Global.current_score += 1
  queue_free()
