extends Node

enum State {
	UNKNOWN,
	INTERACT,
	DIALOGUE,
}

var state: State = State.INTERACT
