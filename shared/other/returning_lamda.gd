@tool
extends EditorScript

func _run() -> void:
	get_lambda().call()

func get_lambda():
	return (func(): print("hello, world"))
