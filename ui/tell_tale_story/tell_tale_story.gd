extends Node2D


signal page_update(page: int)

var pageIdx = 0
var pages = []

var story_text
#@onready var story = load("res://assets/Spells.txt")
#story_text = load("res://tell_tale_heart.md")


func trim_text(text):
	text = text.lstrip(' ').lstrip('\n').lstrip(' ').lstrip('\n')
	text = text.rstrip(' ').rstrip('\n').rstrip(' ').rstrip('\n')
	text = text.rstrip(' ').rstrip('\n')
	return text

#https://docs.godotengine.org/en/stable/classes/class_fileaccess.html
#const story = preload("res://")
#var file = FileAccess.open("user://save_game.dat", FileAccess.READ)
#var content = file.get_as_text()
func load_from_file():
	var file = FileAccess.open("res://assets/tell_tale_heart.md", FileAccess.READ)
	var content = file.get_as_text()
	
	var text_array = content.split("\n")
	
	for text in text_array:
		text = trim_text(text)
		if len(text) != 0:
			pages.append(trim_text(text))
	
	return content
	
func _ready() -> void:
	
	print("read text file from assets")
	
	print("res://tell_tale_heart.md")
	
	story_text = load_from_file()
	
	pageIdx = 0
	setPage()

func setPage():
	
	pageIdx = pageIdx % len(pages)
	if pageIdx < 0:
		pageIdx = 0
	
	$page.text = pages[pageIdx]
	$page_count.text = str(pageIdx + 1)  + '/' + str(len(pages))
	
	print("page_update", page_update)
	page_update.emit(pageIdx)

func _on_next_pressed() -> void:
	pageIdx += 1
	print(pageIdx)
	setPage()


func _on_previous_pressed() -> void:
	pageIdx -= 1
	print(pageIdx)
	setPage()
