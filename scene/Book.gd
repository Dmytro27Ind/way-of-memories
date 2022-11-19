extends Node2D

var array = [

"My name is Eva and records in this diary are the proof that X didn't affect me. I even didn't have the money for buying it. More than one mounth has passed since those accident and only now have I found the strength to move forward and look for a way to use...\n[right]Page 1[/right]",

"Story X began only 4 years ago, when experiments with its implantation into animals were first performed. The company that did it claimed that it was completely safe, so people started using this product. It has become so popular that its use by almost everyone. And it was safe. Almost.\n[right]Page 4[/right]",

"2 months ago I have noticed that X users sometimes lost consciousness, they didn't react to anything, looked like robots, but said that they were just very tired from learning or working...\n[right]Page 6[/right]",

"4 weeks ago, at night, I heard the sounds of someone marching down a path near my boarding school. I looked out the window and saw thousands of people walking in an unknown direction. The way they walked was as clear as the army's parade. From my boarding school, a column of students was walking towards that path...\n[right]Page 8[/right]",

"The oppressed were used as a labor force. They built objects with unknown for anyone purpose. Those process resembled the coordinated work of artificial intelligence. Such people eventually lost control of themselves, and were also ordered to kill stubborn survivors and set traps for them...\n[right]Page 15[/right]",

"Today I met two scientists who were originally involved in testing of X. They said that they were actually forced to draw up a report with results that would show that this thing could be safely implanted in humans, although in reality it was quite the opposite. Then they were detained in order no one would find out the truth...\n[right]Page 21[/right]",

"Since this time, James and Taras saved my life numerous times. I completely trust them. They are me family. They claim to know how to make so-called drugs from the effects of X on humans. These drugs should interfere with the human body's communication with X. However, they need embryonic stem cells. Mrs. Nadija is ready to sacrifice her child...\n[right]Page 25[/right]",

"For 2 weeks now we have been looking at least for some medical institution or laboratory where surgery finding for fetal removaling and further drug development would be possible...\n[right]Page 30[/right]"
]
onready var t=get_node("/root/Paging")

signal book2_collect

func vanish():
  queue_free()
var index = 0


func _on_Area2D_body_entered(body):
	
	index = t.get_page()
	
	var rtl: RichTextLabel = RichTextLabel.new()
	rtl.anchor_right = 1
	rtl.anchor_bottom = 1
	rtl.margin_left = -200
	rtl.margin_top = -200
	rtl.margin_right = 200
	rtl.margin_bottom = -30
	rtl.set_use_bbcode(true)

	if index >= 8:
		return	
	rtl.append_bbcode("[color=white][shake rate=2 level=5]"+ array[index] +"[/shake][/color]")


	add_child(rtl)




	



func _on_Area2D_body_exited(body):
	emit_signal("book_collect")
	$AnimationPlayer.play("vanish")

			
