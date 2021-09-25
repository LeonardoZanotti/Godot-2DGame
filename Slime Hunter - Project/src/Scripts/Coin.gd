extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var coinScore := 75

func _on_Coin_body_entered(body: Node) -> void:
	picked()
	
func picked() -> void:
	anim_player.play("Fade_out")
	PlayerData.score += coinScore
