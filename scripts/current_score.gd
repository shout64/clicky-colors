extends RichTextLabel

func _process(_delta: float) -> void:
  set_text("High score: " + str(Global.high_score) + "\nCurrent score: " + str(Global.current_score))
