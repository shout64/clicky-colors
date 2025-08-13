extends Node2D

@export var buttons : Array[PackedScene]

var next_button

func _ready() -> void:
  Global.current_score = 0
  load_next_button()

func load_next_button() -> void:
  var random_button = buttons.pick_random()
  
  next_button = load(random_button.get_path()).instantiate()

func _on_button_spawning_timer_timeout() -> void:
  add_child(next_button)
  load_next_button()

func _input(event: InputEvent) -> void:
  if event.is_action_pressed("reset"):
    get_tree().reload_current_scene()
