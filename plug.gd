extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug("godot-extended-libraries/godot-debug-menu", {"commit": "2d5d67012c76b272173dcfb4947a65dc385fab94"})
	plug("KoBeWi/Godot-Universal-Fade", {"commit": "f091514bba652880f81c5bc8809e0ee4498988ea"})
	plug("HungryProton/scatter", {"commit": "9cbdd801f4ef6c77140e84ed9b0d96df2c6c5bb1"})
	plug("samclee/EZ-Sfx-and-Music", {"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359"})

	# Patched version
	plug("florianvazelle/EasyMenus", {"commit": "4d960ef6ab9f51a206e2eb40c2cc0b8f8eced71a"})
