extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug("godot-extended-libraries/godot-debug-menu", {"commit": "2d5d67012c76b272173dcfb4947a65dc385fab94"})
	plug("KoBeWi/Godot-Universal-Fade", {"commit": "ddab6c26cf174fab107fbd6b4e66a5a350e83c22"})
	plug("HungryProton/scatter", {"commit": "9cbdd801f4ef6c77140e84ed9b0d96df2c6c5bb1"})
	plug("samclee/EZ-Sfx-and-Music", {"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359"})

	# Patched version
	plug("florianvazelle/EasyMenus", {"commit": "3b8602985191f6a128808068d250b5b336d05379"})
