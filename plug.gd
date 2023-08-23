extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug("godot-extended-libraries/godot-debug-menu", {"commit": "f2eeddcc357537740013ae68374cd14fab7f7d70"})
	plug("KoBeWi/Godot-Universal-Fade", {"commit": "ddab6c26cf174fab107fbd6b4e66a5a350e83c22"})
	plug("HungryProton/scatter", {"commit": "4fa5c60659d03d8cbffb70aa9b5f4cbc57ba85f6"})
	plug("samclee/EZ-Sfx-and-Music", {"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359"})

	# Patched version
	plug("florianvazelle/EasyMenus", {"commit": "3b8602985191f6a128808068d250b5b336d05379"})
