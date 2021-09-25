extends Control

onready var scene_tree := get_tree()
onready var paused_overlay: ColorRect = get_node("PauseOverlay")
onready var scoreLabel: Label = get_node("Label")
onready var pauseTitleLabel: Label = get_node("PauseOverlay/Title")

const DIED_MESSAGE = "You died"

var paused = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_PlayerData_player_died")
	update_interface()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and pauseTitleLabel.text != DIED_MESSAGE:
		self.paused = not paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = paused
	paused_overlay.visible = paused

func update_interface() -> void:
	scoreLabel.text = "Score: %s" % PlayerData.score

func _PlayerData_player_died() -> void:
	self.paused = true
	pauseTitleLabel.text = DIED_MESSAGE
	
