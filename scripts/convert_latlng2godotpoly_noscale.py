import sys; 
import geopandas as gp
import numpy as np
import shapely
import pandas as pd
np.set_printoptions(threshold=sys.maxsize)

print("WARNING: data is out of data since cities.tscn and tndistricts.tscn have new additions that arent updated in backing data here"
print("Munis.csv needs to be spell corrected and some cities have moved to new districts")
print("font and style stuff of tndistricts.tscn has changed through editor")
print("sync and run - best way generate files in scripts dir. Compare with files in main director BEFORE over writing them")
sys.exit(0) 
l2=gp.read_file('tn_dist.json')
#required for muni lat long to be in same ref frame
l2.to_crs(epsg=4326,inplace=True)
#spelling was different from what was used in main project so changed
l2.loc[9,'Name']="Kanchipuram" 
l2.loc[36,'Name']="Mayiladithurai"
l2.loc[15,'Name']="Perumbalur"
l2.loc[33,'Name']="Vilippuram"
l2.loc[20,'Name']="Sivagangai"
l2.loc[16,'Name']="Pudukotai"
l2.loc[27,'Name']="Tiruchirapalli"
l2.loc[29,'Name']='Tirupathur'
l2.loc[25,'Name']='Tiruvallur'
l2.loc[31,'Name']='Tiruvannamalai'
l2.loc[37,'Name']='Tiruvarur'


munis=pd.read_csv('Munis.csv')
munis[['Lat','Lon']]=munis['LatLong'].str.split(";",expand=True)
munis[['Lat','Lon']]=munis[['Lat','Lon']].astype(float)
munis[['Type']]=munis[['Type']].astype(str)

#l2.plot(ax=ax, facecolor='#0099dd',edgecolor='#002f4f',label='TN',alpha=.78, linewidth=.4)
#bb=districts.plot(ax=ax,facecolor='#ffcc66',edgecolor='#002f4f',label='TN'
#	, linewidth=1)#,picker=5 
components=[]
with open('tndistricts.tscn','w') as godot:
	right=0
	left=1000
	top=0 # will be 13 with scale yfact=-1 becomes -13
	bottom=-1000 # will be 8 with scale yfact=-1 becomes -8
	#go through all geometries and work out 
	#what scale and position should be to fit screen size in argv[1] 
	#
	for i in l2[['Name','geometry']].itertuples():
		if i.geometry.geom_type == 'Polygon':
			#print(len(i.geometry.exterior.coords))
			sp=i.geometry.simplify(0.01)
			sp=shapely.affinity.scale(sp, yfact= -1.0, origin=(1,0)) # what is origin doing?
			bounds = sp.bounds # (minx, miny, maxx, maxy)
			#print(len(sp.exterior.coords))
			#print(i.Name, sp.bounds)
			components.append({'name':i.Name, 'b':bounds, 'shape':sp })
		else:
			#print(i.Name, i.geometry.geom_type, len(i.geometry) )
			#find the largest area and plot it
			maxidx=0
			maxarea=0
			cnt=0
			for a in i.geometry.geoms:
				#print(i.Name, a.area)
				if a.area> maxarea:
					maxidx=cnt
					maxarea=a.area
				cnt=cnt+1
			print(i.Name, 'using',maxidx, 'before simplify', len(sp.exterior.coords))
			sp=i.geometry.geoms[maxidx].simplify(0.02)
			print(len(sp.exterior.coords))
			sp=shapely.affinity.scale(sp, yfact= -1.0, origin=(1,0)) # what is origin doing?
			bounds = sp.bounds
			components.append({'name':i.Name, 'b':bounds, 'shape':sp})
		if min(bounds[2],bounds[0]) < left:
			left=min(bounds[2],bounds[0])
		if max(bounds[3],bounds[1]) > bottom: 
			bottom=max(bounds[3],bounds[1])
		if max(bounds[2],bounds[0]) > right:
			right=max(bounds[2],bounds[0])
		if min(bounds[3],bounds[1]) < top: 
			top=min(bounds[3],bounds[1])
	#load steps = 1 + number of ext resources + number of subresources
	godot.write('[gd_scene load_steps=3 format=2]\n')
	#godot.write('[ext_resource path="res://tndistricts.gd" type="Script" id=1]\n')
	godot.write('[ext_resource path="res://DroidSans.ttf" type="DynamicFontData" id=1]\n')
	godot.write('[sub_resource type="DynamicFont" id=1]\n')
	godot.write('font_data = ExtResource( 1 )\n')
	
	godot.write('[node name="Districts" type="Node2D"]\n')
	print('top left', top, left)
	print('bottom right', bottom, right) 
	print('width', abs(left-right))
	print('height', abs(top-bottom))

	width_multiplier = float(sys.argv[1]) / abs(left-right)
	height_multiplier = float(sys.argv[2]) / abs(top-bottom)
	print(width_multiplier)
	print(height_multiplier)
	aspect=1 / np.cos((abs(top-bottom)/2) * np.pi / 180)
	
	for i in components:
		godot.write('[node name="%s" type="Area2D" parent="."]\n' % i['name'])
		godot.write('show_behind_parent=true\n')
		godot.write('z_index=-3\n')
		godot.write('position= Vector2(%s ,%s)\n' % (width_multiplier*i['b'][0] - left*width_multiplier, height_multiplier*i['b'][1]- top*height_multiplier))
		#print("%s=[%s, %s, %s, %s ] " % (i['name'], width_multiplier*i['b'][0] - left*width_multiplier, height_multiplier*i['b'][1]- top*height_multiplier, width_multiplier*abs(i['b'][0]-i['b'][2]), height_multiplier*abs(i['b'][1]-i['b'][3])) )
		godot.write('[node name="Poly" type="Polygon2D" parent="%s"]\n' % i['name'])
		latlngcoords=np.asarray(i['shape'].exterior.coords)
		screencoords=[]
		for li in latlngcoords:
			screencoords.append(li[0] *width_multiplier - i['b'][0]*width_multiplier)
			screencoords.append(li[1] *height_multiplier - i['b'][1]*height_multiplier)
		godot.write('polygon = PoolVector2Array(%s)\n' % str(screencoords).replace('[','').replace(']',''))
		godot.write('color=Color( 1, 1, 0.88, 1 )\n')
		godot.write('[node name="CP" type="CollisionPolygon2D" parent="%s"]\n' % i['name'])
		godot.write('modulate = Color(0.0,0.0,0.0,1.0)\n')
		godot.write('polygon = PoolVector2Array(%s)\n' % str(screencoords).replace('[','').replace(']',''))
	# add district labels
	for i in components:
		godot.write('[node name="lbl%s" type="Label" parent="." groups=["dlabels"]]\n' % i['name'])
		godot.write('custom_fonts/font = SubResource( 1 )\n')			
		godot.write('custom_colors/font_color=Color(0.68, 0.93, 0.58, 1.0)\n')
		godot.write('custom_colors/font_color_shadow = Color( 0.2, 0.7, 0.2, 1 )\n')
		godot.write('custom_constants/shadow_offset_x = 1\n')
		godot.write('custom_constants/shadow_offset_y = 1\n')
		godot.write('custom_constants/shadow_as_outline = 0\n') 
		godot.write('visible = false\n')
		#godot.write('size=32\n')
		godot.write('rect_position= Vector2(%s ,%s)\n' % (width_multiplier*i['b'][0] - left*width_multiplier, height_multiplier*i['b'][1]- top*height_multiplier))
		#godot.write('rect_scale= Vector2(%s ,%s)\n' % (1/width_multiplier, 1/height_multiplier))
		godot.write('text = "%s"\n' % i['name'])

with open('Cities.tscn','w') as godot:
	godot.write('[gd_scene load_steps=2 format=2]\n')
	#godot.write('[ext_resource path="res://tndistricts.gd" type="Script" id=1]\n')
	#godot.write('[ext_resource path="res://DroidSans.ttf" type="DynamicFontData" id=1]\n')
	#godot.write('[sub_resource type="DynamicFont" id=1]\n')
	#godot.write('font_data = ExtResource( 1 )\n')
	godot.write('[ext_resource path="res://Point.tscn" type="PackedScene" id=1]\n')
	godot.write('[node name="Cities" type="Node2D"]\n')
	#godot.write('[node name="bottomright" type="Position2D" parent="."]\n')
	#godot.write('position = Vector2( %s, %s)\n\n' % (right, bottom))
	for i in munis[['#Name','Type','Lat','Lon','District']].itertuples():
		godot.write('[node name="%s" parent="." instance=ExtResource( 1 ) groups=["allcities","%s","%s"]]\n' % (i[1], i.District,i.Type))
		godot.write('group="%s"\n' % i.Type)
		godot.write('district="%s"\n' % i.District)
		if i.Type == 'Muni Corporation':
			godot.write('radius=7\n')
			#godot.write('scale = Vector2( 0.5, 0.5)\n')
		elif i.Type == 'Municipality Selection grade':
			godot.write('radius=5\n')
			#godot.write('scale = Vector2( 0.4, 0.4)\n')
		elif i.Type == "Municipality Second grade":
			#godot.write('scale = Vector2( 0.3, 0.3)\n')
			godot.write('radius=4\n')
		elif i.Type == "Municipality Second grade":
			godot.write('radius=2\n')
			#godot.write('scale = Vector2( 0.2, 0.2)\n')
		else:
			godot.write('radius=5\n')
			#godot.write('scale = Vector2( 0.4, 0.4)\n')		
		godot.write('position = Vector2( %s, %s)\n\n' % (width_multiplier * i.Lon - left*width_multiplier, height_multiplier *-1*i.Lat - top*height_multiplier))

print('latlong aspect correction:',aspect)
print('aspect ratio', abs(left-right)/abs(top-bottom))

#l=sys.stdin.read(); 
#exec('b=['+l+']'); 
#print(len(b)); 
#x=[b[i] for i in range(0,len(b),2)]; 
#y=[b[i] for i in range(1,len(b),2)]; 
#print('top left',minx, maxy)
#print('bottom right',maxx, miny) 
#print('width',maxx-minx)
#print('height', maxy-miny)

#width_multiplier = float(sys.argv[1]) / maxx-minx
#height_multiplier = float(sys.argv[1]) / maxy-miny
#print(width_multiplier)
#print(height_multiplier)
#multiplier = min(width_multiplier, height_multiplier)
