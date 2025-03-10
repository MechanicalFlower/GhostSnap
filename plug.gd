extends "res://addons/gd-plug/plug.gd"


func _plugging():
	plug(
		"godot-extended-libraries/godot-debug-menu",
		{"commit": "f8d1202df122f7e8227ec3a7bdcff745e9780d52", "renovate-branch": "master"}
	)
	plug(
		"KoBeWi/Godot-Universal-Fade",
		{"commit": "f091514bba652880f81c5bc8809e0ee4498988ea", "renovate-branch": "master"}
	)
	plug(
		"samclee/EZ-Sfx-and-Music",
		{"commit": "ac2b77c0336ff6edf6b26aa9342628d2ad63f359", "renovate-branch": "main"}
	)
	plug(
		"nisovin/godot-coi-serviceworker",
		{"commit": "4eaff9386ac7d0cd93bedba47143728b18b97371", "renovate-branch": "main"}
	)

	# Patched version
	plug(
		"florianvazelle/EasyMenus",
		{"commit": "018ab39001f862abbd6ca424258a9a548589d61c", "renovate-branch": "master"}
	)
	plug(
		"florianvazelle/scatter",
		{"commit": "02b71c2637687b00d4da4f0ff0f108f6700f1d93", "renovate-branch": "v4"}
	)
