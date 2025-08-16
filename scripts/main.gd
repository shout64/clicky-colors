extends Control

@export var buttons        : Array[PackedScene]
@export var screen_padding : float = 0.8

@onready var viewport_width  : int           = get_viewport().size.x
@onready var viewport_height : int           = get_viewport().size.y
@onready var hearts_container: HBoxContainer = $MainContainer/UI/HeartsContainer

var next_button

func _ready() -> void:
  Global.current_score = 0
  Global.current_hearts = Global.max_hearts
  load_next_button()

func load_next_button() -> void:
  var random_button = buttons.pick_random()
  
  next_button                 = load(random_button.get_path()).instantiate()
  next_button.global_position = Vector2(get_random_spawn_point())
  next_button.connect("take_damage", hearts_container.on_take_damage)  

func get_random_spawn_point() -> Vector2:
  var rand_x : float = randf_range(viewport_width * (1 - screen_padding), viewport_width * screen_padding)
  var rand_y : float = randf_range(viewport_height * (1 - screen_padding), viewport_height * screen_padding)

  return Vector2(rand_x,rand_y)

func _on_button_spawning_timer_timeout() -> void:
  add_child(next_button)
  load_next_button()

func _input(event: InputEvent) -> void:
  if event.is_action_pressed("reset"):
    get_tree().reload_current_scene()

func _on_hearts_container_on_failure() -> void:
  get_tree().reload_current_scene()
