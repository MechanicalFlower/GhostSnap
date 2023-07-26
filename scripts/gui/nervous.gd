@tool
class_name Nervous
extends RichTextEffect

const SPLITTERS = [" ", ".", ",", "-"]

# Syntax: [nervous scale=1.0 freq=8.0][/nervous]
var bbcode = "nervous"

var _word = 0.0


# Gets TextServer for retrieving font information.
func get_text_server():
	return TextServerManager.get_primary_interface()


func _process_custom_fx(char_fx: CharFXTransform):
	if char_fx.relative_index == 0:
		_word = 0

	var scale: float = char_fx.env.get("scale", 1.0)
	var freq: float = char_fx.env.get("freq", 8.0)

	var character = get_text_server().font_get_char_from_glyph_index(
		char_fx.font, 1, char_fx.glyph_index
	)
	if char(character) in SPLITTERS:
		_word += 1

	var s = fmod((_word + char_fx.elapsed_time) * PI * 1.25, PI * 2.0)
	var p = sin(char_fx.elapsed_time * freq)
	char_fx.offset.x += sin(s) * p * scale
	char_fx.offset.y += cos(s) * p * scale

	return true
