extends Control

const SPEED_UP_MULTIPLIER := 10.0

const RightTemplate: PackedScene = preload("res://scenes/gui/credits/right_template.tscn")
const LeftTemplate: PackedScene = preload("res://scenes/gui/credits/left_template.tscn")

@export var speed: int = 20

var speed_up: bool = false

var credits := [
	"A game made by Florian Vazelle.",
	"Made with Godot Engine.",
	"For the 'A Game By Its Cover' Game Jam 2023.",
	"Inspired by the Famicase: Ghost Hunter, by Gabby DaRienzo.",
	(
		"Using awesome addons, arts, musics & sound effects from: "
		+ (
			", "
			. join(
				[
					"Hugo Locurcio",
					"Savo Vuksan",
					"Tan Jian Ping",
					"HungryProton",
					"Tomek",
					"Light Game Studio",
					"loafbrr",
					"Icons8",
					"Lennart Demes",
					"Elegant Crow",
					"GGBotNet",
					"Kenney",
					"miniyama",
					"OwlishMedia",
					"genaralskar",
					"axilirat",
					"BalaDeSilver",
				]
			)
		)
	),
	"Thank you for playing! <3",
]
var credit_count: int = len(credits)

@onready var node = get_node("%Control")


func _ready():
	var left: bool = true
	var num_image: int = len(CreditManager._textures)

	for i in range(0, credit_count):
		var j: int = floor(lerp(0, num_image, i / credit_count))

		var template: Node
		if left:
			template = LeftTemplate.instantiate()
		else:
			template = RightTemplate.instantiate()
		left = !left

		var text = credits[i]
		var label: Label = template.get_node("Label")
		label.set_text(text)

		var texture = CreditManager._textures[j]
		var tex_rect: TextureRect = template.get_node("TextureRect")
		tex_rect.set_texture(texture)

		node.add_child(template)

		var spacer = Control.new()
		spacer.custom_minimum_size.y = 68

		node.add_child(spacer)

	node.get_parent().global_position.y = (credit_count * 512 + credit_count * 68) / 2


func _process(delta: float):
	node.global_position.y -= (delta * SPEED_UP_MULTIPLIER if speed_up else delta) * speed


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/gui/menu.tscn")
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false
