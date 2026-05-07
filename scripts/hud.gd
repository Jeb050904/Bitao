extends CanvasLayer

signal start_game

func _ready():
	$MessageLabel.show()
	$StartButton.show()

func update_score(value):
	$ScoreLabel.text = "Score: " + str(value)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the Creeps!"
	$MessageLabel.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_message_timer_timeout():
	$MessageLabel.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	$MessageLabel.hide()
	emit_signal("start_game")
