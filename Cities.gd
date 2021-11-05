extends Node2D

var df
func init_label_font():
	var f=load("res://DroidSans.ttf")
	df=DynamicFont.new()
	df.font_data=f
	df.size=18

var stats={}
#counts for each city type per district 
func init_stats():
	for i in Data.Cities:
		if i.district in stats:
			if i.group in stats[i.district]:
				stats[i.district][i.group]+=1
			else:
				stats[i.district][i.group]=1
		else:
			stats[i.district]={}
			stats[i.district][i.group]=1

#Cities dict is grouped by District in of to enable $Cities.of[x] 
var of={}
func group_by_district():
	for i in Data.Cities:
		if i.district in of:
			of[i.district].append(i)
		else:
			of[i.district]=[i]
			
func _ready():
	init_label_font()
	#init_stats()
	group_by_district()
	update()

var mtype='all'
var district='all'
var city=''
var cpos
var crad

func _draw():
	if city!='':
		draw_string(df, cpos, city, 'f92672')
		draw_circle(cpos, crad, 'ff2207')
		return
	if district=='':
		return
	if district == 'all':
		for i in Data.Cities:
			if i.group==mtype:
				var p=i.position 
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, i.radius, 'ff2207')		
	else:
		for i in Data.Cities:
			#print(i.name, ' ', i.x,' ', i.y)
			if i.group==mtype and i.d == district:
				var p=i.position 
				draw_string(df, p+Vector2(15, 0), i.name, 'f92672')		
				draw_circle(p, i.radius, 'ff2207')

func clear():
	_draw_cities('','','')

#func _draw_city(c,p,r):
#	_draw_cities('', '', c,p,r)

func _draw_cities(d, munitype, c='',p=0,r=0):
	
	if d !='' and munitype!='':
		show()
		mtype=munitype
		district=d
		update()
	else:
		if c!='':
			show()
			city=c
			crad=r
			cpos=p
			update()
			return
		mtype=''
		district=''
		city=''
		crad=0
		cpos=0
		hide()	
