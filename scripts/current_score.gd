extends RichTextLabel

func _process(delta: float) -> void:
  set_text("Current score: " + str(Global.current_score))
