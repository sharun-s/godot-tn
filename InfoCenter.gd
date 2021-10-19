extends GridContainer
#code facttype - p:people, f:food, m:movies, c:culture/temples/religion related, h:history 
var facts:={
		Ariyalur=[
			'h:fields of Cretaceous age marine fossils (100 millions year old) are found here showcased in the Museum at Varanavasi', 
			'h:Gangaikonda Cholapuram located here was the capital of the Chola Empire before it moved to Tanjore',
			"h:The ruins of the Chola capital and the famous Temple here are now a World Heritage site",
			"District was created in 2007 from the southern part of Perumbalur district"
			],
		Chennai=[
			"Kasimedu fishing harbour is the largest Fish Auction site in the country moving more than 200 tons of fish a day",
			"State Capital with 10% of the states population", 
			"Marina Beach, India's longest and the Worlds second longest beach is located here", 
			"Center of the Tamil Film Industry nicknamed Kollywood, as most studio were built in the Kodambakkam neighbourhood",
			"Valluvar Kottam, built in honor of Tamil poet Thiruvalluvar"],
		Chengalpattu=[
			'District was created in 2019 from Kanchipuram',
			'h:World heritage site of 7th century monuments, temples and caves at Mahabalipuram',
			"Named after the Sengazhuneer poo (Red White Lily) that grows in abundance along the river banks",
			"h:Mahaballipuram site of some of the earliest Rock Temples and Stone Sculpture that influenced the style of Temple Architecture throughout South India"],
		Coimbatore=[
			"Location of India's first Insect Museum with a collection of 20000 Insects",
			'G. D. Naidu, known as the Edison of India, was from here. His inventions and entrepreneurship turned the region into a industrial hub',
			'f:Kalakki meaning to mix is popular street food here (super soft omelet with masala)',
			'Wet Grinder used for idli/dosa was invented here. More than 800 factories manufacture it and the area has received the GI Tag from Govt of India',
			'Eastern end of the Palakkad Gap, the lowest pass through the Western Ghats linking Kerala and Tamil Nadu. Also called Kovai',
			'Manchester of South India due to extensive textile industry, fed by the surrounding cotton fields',
			'p:C Subramaniam, Bharath Ratna Awardee for his role in Indias Agri/Dairy Revolution was from Pollachi located here'		
		],
		Cuddalore=[
			'Along with Vilipuram this District was created from breakup of South Arcot in 1993',
			'f:A large portion of Cashew Nut production of the state happens here in Panruti',
			'c:Nataraja dance at thilai Natyanjali Dance Festival feb march on mahashivratri expand...',
			'Pichawaram mangrove forests',
			'Koodalur means confluence in Tamil. It is the place where the Pennaiyar, Kedilam, Paravanar and Uppanaar rivers join',
			'Neyveli Lignite Corporation is located here. The mining and power generation giant was given the Navratna status in 2011',
			'h:Was known as Naadu Nadu or the middle kingdom betweene Cholas in the South and the Pallavas in the North', 
			"h:Fort St David in Cuddalore was one of the main British trading posts controling their activities in South India in the early 1700. So Cuddalore became the site of multiple wars with the French based 25kms North in Pondicherry",
			"Silver Beach is one of the longest beaches found on the Coromandel Coast. 2700 people lost their life here during the 2004 Tsunami", 
			'c:Chidambaram temple',
			'Pichawaram Mangrove forests'],
		Dindigul=[
			'Created in 1985 from the northern part of Madurai district',
			'f:Periyakottai Brinjal', 
			'Palani Murugan temple located here on the Sivagiri hill, sees 7 million pilgrims a year',
			"f:the famous Palani temples Panchamirtham, sweet made of 5 ingredients- banana, jaggery, cow ghee, honey and cardamom",
			"Kodaikanal Malai Poondu (Hill Garlic) known for its medicinal properties and long shelf life has been given a GI Tag",
			'Kodaikanal, in tamil translates to The Gift of the Forest, is very popular hillstation located here',
			'Palani Hills part of Western Ghats lies within this district. Its where the famous Liril commercial was shot'],
		Dharmapuri=[
			'District was created in 1965 from northern part of Salem district',
			"m:Hogenakkal falls shot to fame after Chinna Chinna Asai (Roja), Mazhaiye Mazhaiye(Rhythm) and Raath Ka Nasha Abhi (Asoka) were shot here",
			"Hogenakkal falls, which means smokey rocks, is where the river Cauvery enters Tamil Nadu",
			"Taking a ride in the local bowl shaped boats made of woven grase called a Parisal/Coracle is very popular tourist activity here",
			"p:Veeraappan, the notorious elephant poacher, sandalwood smuggler, wanted for the murder of 184 people was caught here"],
		Erode=[
			'District was created from Coimbatore in 1979',
			"Turmeric or Manjal from here is known for its unique color. The area is the 2nd largest Tumeric market in India) and major exporter",
			"Jamakkalam Carpets and Blankets made by the weavers of Bhavani are world famous for their patterns",
			"Agri powerhouse due to rivers and dams",
			"Sathyamangalam Tiger Reserve home to 83 tigers and 111 Leopards",
			"p:Freedom fighter Tiruppur Kumaran was born here. Protesting the arrest of Gandhi in 1932, while holding a banned Flag of India he was beaten to death by the British Police",
			"p:E V Ramasamy known as Periyar or Father of Dravidian movement to eradicate caste inequality that lead to emergence of DMK & ADMK was from here"
		],
		Kanyakumari=[
			"Martandam town located here is famous for honey production",
			'On the UN Human Development Index this district comes first within the state',
			'Indias largest wind power farm is located her at Muppandal. Its the 3rd largest in the world',
			'the tiny village of Vadaserry famous for crafting Temple Jewellery with red and green stones or kuchu kal',
			"f:Nanjilnadu cuisine Puttu, Appam, Idiappam, Seafood, Coconut oil based",
			"Southern most district of TN and the Indian main land",
			"Nagarcoil is the District HQ",
			"The only district of TN facing the Arabian Sea",
			"The ancient Kani tribe living in the Western Ghats recently discovered tree climbing crabs in this biodiversity hotspot"],
		Kanchipuram=[
			"District HQ is Kanchipuram also known as the City of a Thousand Temples",
			"h:Capital of the Panllava Kingdom from the 4th to the 9th Century",
			"p:Headquarters of the Kanchi matha, founded by Adi Sankaracharya",
			"Famous for the hand woven silk sarees, the Kanchi Pattu Pudavai. Wedding saree being a speciality",
			"Silk from here has received the GI Tag",
			"p:C N Annadurai, Founder of the DMK and 1st Chief Minister of Tamil Nadu State was from here",
			"c:Ekambareswarar Temple covers 25 acres is one of the largest temple complexes in India. The Southern Gopuram is 11 stories tall making it one of the taller temple towers. Showcasing the architecture of the Vijayanagara dynasty",
			"c:Kailasanathar Temple, panamalai talagireeshwarar and the Vaikunta Perumal Temple found here are nearly 1350 years old",
			"h:Gunduperumbedu fossil bed where plant fossils from 400 million years ago, called poo-kal by locals are found in abundance"
		],
		Krishnagiri=[
			"p:Birthplace of C. Raja Gopalachari popularly known as Rajaji, the first Governor General of India and first Chief Minister of Madras State",
			"Largest producers of Mangoes in India",
			"Largest city here is Hosur 40 km from Bangalore and a major manufacturing hub",
			"The TVS 50, Indias first two seat moped was manufactured here in Hosur and was a big hit. More than 10 million mopeds being sold since.",
			'District was created in 2004 from the northern part of Dharmapuri district'
		],
		Kallakurichi=[
			'Mainly a rural area 50 years ago increased road connectivity has turned into an emerging agricultural hub.',
			'The Kalvarayan Hills are pristine unexplored area with the Vellimalai hilltop becoming a popular tourist spot for locals during the monsoon season.',
			'The famous Koovagam festival held by the transgender community reenacts Krishna transforming into Mohini to marry a Prince Aravan',
			'Was created from the eastern part of Vilippuram district in 2019'],
		Karur=[
			"h:Capital of the Chera Kings who ruled Western Tamil Nadu/Central Kerala at various times from the 1st to 12th Century", 
			"h:A ancient trade post with the Romans who called it Karoura. They traded gold for rice. So the word rice comes from the Tamil araci", 
			"TN Newsprint and Papers Ltd TNPL located here is the largest sugarcane based paper mill in the world",
			'District was created in 1995, along with Perumbalur from northern part of Tiruchirapalli district',
		],
		Perumbalur=[
			'h:Ranjankudi Fort built in the 17th century',
			'Arambavur hand made wood carvings. The artisans of this village are famous and their carvings have recieved a GI Tag',
			'Leads the state in Small Onion production',
			'h:The Karai badlands - a geological heritage site - were marine fossils from the Cretaceous period have been found',
			'h:An 18m long 120 million year old tree (kal-maram) found here (Sathanur Fossil Park) is evidence that the area was under a shallow sea during the Cretaceous period',
			'District was created in 1995, along with Karur from Tiruchirapalli district',
			],
		Pudukotai=[
			'District was created from western part of Thanjavur district in 1974',
			'Moi Virundhu, a tradional practice where money is raised from the community by inviting everyone for a feast',
			'Famous for its Percussinists, Manpoondia Pillai the lantern bearer, one handed kanjira, mirdangams...',
			'Narthamalai, malaiyadapatti paintings show the differences between the chola and pallava art',
			'h:Was a independent princely state ruled  by the Thondaimans since the 17th century'],
		Mayiladithurai=[
			'District was created from the coastal part of Tirvarur in 2020', 
			'Ancient Port town of Poombuhar where the Kaveri meets the sea ',
			'Kaveri Pushkaram festival happens here every 12 yeara place where peacock dance'],	
		Madurai=[
			'p:M S Subbulakshmi, the first musician to receive the Bharat Ratna was born here',
			'm:Thirumalai Nayakkar Palace built in 1636, blends North and South Indian architecture, site of famous movie songs Kannalanea(Bombay), Tere Bina(Guru), Ragasiya Kanavugal(Bheemaa)',
			'Chithirai Festival',
			"Thoonga Nagaram, meaning the city which never sleeps",
			'the beautiful Sungudi sarees. Gujarati weavers, moved here 500 years ago, seeing the local women tying their hair in buns created the now famous tye and die pattern of these sarees',
			'f:bun parotta and kulambu, muttaiparotta (minced parotta and scrambled egg)',
			'f:jigarthanda a drink made with almond gum and the syrup of the sarsaparilla plant',
			'f:paruthipal (made of cottonseeds and jaggery), thengai pal (a warm sweetened coconut milk drink)', 
			'f:keerai vada (a unique, thin fritter made with a medicinal plant called mullu murungai)',
			'c:The Meenakshi Amman Temple is one of the largest temple complexes in the state with 14 Gopurams (Gateway Towers), 33000 scupltures, a thousand pillared hall, tank legend, parrots...',
			'Many areas well known for conducting the Jallikattu (bull taming) ceremony during the Pongal (harvest festival) season',
			'Jasmine (Madurai Malli)'
		],
		Nagapattinam=[
			'p:V. R. Nedunchezhiyan, founder of DMK and Finance Minister under 4 CMs Annadurai, MGR, Karunanidhi & Jayalalitha was born here',
			'Created in 1991 along with Tiruvarur from coastal part of Thanjavur district',
			'p:Sambandar of Sirkazhi and his opposition to the Jains, basis of the bakthi movement. Author of the Thirumarai  ', 
			'c:Velankanni festival', 
			'Was hit by the 2004 Tsunami 6000 lives lost', 
			'The Danish Fort at Tarangabadi is located here' 
		],
		Nilgiris=[
			'the famous 170 year old Botanical Garden on the lower slopes of the Doddabetta peak',
			'Vegetable, Fruit and Spice Festival at Coonoor, Kotagiri and Gudalor are very popular',
			'Summer Festival at Ooty every May is a huge tourist attraction includes the famous Flower Show (3000 rose varieties), Boat Races and a Dog Show',
			'Half the HydroElectric power of the state is generated here at Pykara, Kundah, Moyar',
			'Pykara Dam is one of the oldest Hydraulic Power Plants in South India',
			'Mountain railway here is a World Heritage site for its ingenious engineering through a rugged, mountainous terrain',
			'Doddabetta Peak the highest point in TN at 2600m is located here',
			'Home of the native hill Toda and Badaga tribes',
			"Udhagamandalam or Ooty known as the Queen of Western Ghats is a hillstation located here. It is the district HQ.",
			'Coffee, tea, rubber, eucalyptus plantations',
			'Mudumalai Tiger Reserve is the largest in TN with 160 using the corridor and 103 resident ' ],
		Namakkal=[
			'District was created in 1997 from southern part of Salem district',
			'p:Chairman of the Tata Group, N Chandrasekaran was born here',
			'p:The R in R K Narayan and R K Laxman refers to the town of Rasipuram located here',
			'f:The famous nutty flavoured Ghee made in Rasipuram, from cattle raised in the Kolli Hills used in nei dosa and mysore pak',
			'With the fall of the Cholas in the 12th Century, for a breif period Sendamangalam located here became the capital of the Kadava kings',
			'Cauvery flows through the town of Tiruchengode located here',
			'Known for its Poutry Farms and  Lorry body building industry', 
			'Its name derives from Namagiri, the name of the single 65m high rock formation at the center of the Namakkal town. A Fort covering one and half acres was built on top of the rock in the 17th century'],
		Ranipet=[
			"f:The famous Ambur biryani. The Mughals ruled this region and influenced the cuisine. Unique due to local type of rice used, and cooking meat and rice together unlike other biriyanis separately",
			"f:Arcot Makkan Peda is a speciality - a flattened gulab jamun but filled with grated dry fruits soaked in sugar syrup",
			"Leather goods manufacturing hub",
			'End point of the first Passenger Railway Line built in South India in 1854 - Walajahpet-Veyasarapady (Chennai)',
			'Built on the Palar River banks, by the Nawab of Arcot, in honour of the Rani of Gingee who committed Sati after her husband Desingh died in the Battle of Gingee',
			'District was formed from eastern parts of Vellore district in 2019',
			],
		Ramanathapuram=[
			"p:Birth place of A.P.J Abdul Kalam, rocket man, pokhran 2, peoples president...",
			"Hi! I am Abdul. Welcome to Pamban Island",
			'According to legend the site from which Ramas Army builds a bridge over the ocean to Lanka',
			"Mandapam - Pamban Bridge - Pamban-Rameshwaram/Dhanushkodi",
			"In 1964 a cyclone hit Pamban Island with 25 ft waves washing away the town of Danushkodi. Today the remain of the ghost town are a tourist attraction."
		],
		Salem=[
			'The World best Magnesite deposits are found here in the Chalk Hills',
			'Silver anklets or kolasu make up 60% of silver ornaments sold in India',
			'Silk Saree weavers of Panjukalipatti',
			'f:Essence Dosa',
			'f:Thattu vadai settu is very common snack found here - thattai smeared with chutney topped with shredded beetroot, carrot and onion',
			'Silk, or Venpattu, from here has received the GI tag',
			'Steal industry',
			'Mettur Dam, on the Cauvery river is the largest dam in the state', 
			'Shevaroy Hills - yercaud - orchidarium - old coffee plantations highest peak of the southern eastern ghats in TN - lots of species of snake, lizard, frogs and birds not found anywhere else'],
		Sivagangai=[
			'District was carved out of Ramanathapuram district in 1985 along with Virudhunagar',			
			'm:Karaikudi, with its Chettiar palaces is a very popular film location. Aathangudi palace, Rao Bahadur palace and nearly 50 other palatial houses are occupied on most days by film crew',
			'Kottan basket weaving from palm leafs with its vibrant colors',
			'p:Kaniyan - Yaadhum Oore Yaavarum Kelir',
			'Chettinad formed by a prosperous banking and business community built from trading with Burma, Ceylon and Malaysia',
			'Athangudi tiles',
			'h:home of the famous Maruthu Brothers who fought the East India Company in the Polygar Wars', 
			'f:Known for the famous Chettinad cuisine',
			'h:Found here is the 2500 year old Keezhadi excavation site, including plates with the Tamil-Brahmi script'
		],
		Theni=[
			'Cumbum is famous for the bullock cart (rekhla) racing. Races are held here every year during the Muthalamman temple festival',
			'The fertile Cumbum valley between the Thekkadi Hills and Kodaikanal Hills is the only region in the country where Grapes can be produced year round',
			'p:Ilaiyaraaja, the famous film composer, for more than a 1000 movies, was born here in Pannaipuram.',
			'Cardamom estates',
			'Indian Neutrino Observatory',
			'The Meghamalai range also called the High Wavy Mountains',
			'Meghamalai Wildlife Sanctuary'],
		Tiruvarur=[
			'Formed in 1991 along with Nagapattinam from eastern part of Thanjavur district',
			'c:Somaskanda art - In a style unique to the area Murugan is depicted surrounded by Shiva and Parvathi',
			'c:Thyagaraja Temple Chariot found here stands 96 feet tall',
			'p:Birthplace of Saint Thyagaraja, the composer of Carnatic music'	
		],
		Thanjavur=[
			'p:M. S. Swaminathan, was born here in Kumbakonam, called the Father of the Green Revolution for increasing food production in the country',
			'The famous painting style which uses gold foil, glass beads and gems over the painting done on wood. Locals call it palagai padam or wood picture', 
			'Art plates of the region have received the GI Tag',
			'Netti Workds',
			'Bronze idols and statues made by the artisans of Swamimalai is a thousand year old craft',
			"The Rice Bowl of Tamil Nadu",
			"Popularized Ghee Pongal and Puliyodarai (tamarind rice)",
			"c:Kumbakonam, every 12 years Mahamaham festival draws millions of devotees for a dip in the huge temple tank complex spanning 20 sq acres",
			"p:Srinivasa Ramanujam, untrained in maths, turned out to be one of the greatest Mathematicians of all time, grew up here in Kumbakonam",
			"c:The 1000 year old Brihadeshwara temple",
			"h:Seat of the Chola Empire and now a World Heritage site",
			"Thanjavur dolls popularly known as Thalaiyatti Bommai are made of clay which is found along the river Cauvery"
		],
		Tirunelveli=[
			"f:Halwa made famous by the Iruttukadai Halwa shop. Halwa was made through the day and sellout within minutes of shop opening at night", 
			"Kudrevatti hill station",
			"m:Kalyani Theertham and Agasthya falls were Azhagaana Raakshasiye from Mudhalvan was shot",
			"Korai grass (reed) mats of Pattamadai called Pattamadai Pai",
			"ISROs Rocket Engines are assembled and tested at Mahendragiri located here",
			"p:Agastyamalai mountain is a popular pilgrimage site to Sage Agastya considered father of the Tamil Language",
			"Kalakkad Mundanthurai Tiger Reserve (KMTR) wildlife include Lion tailed Macaques, Elephants, Tigers, Peacock, Nilgiri Langur, Gaur amd Leopards"],
		Tiruvannamalai=[
			'Along with Vellore this district was created from breakup of North Arcot in 1989',	
			"the famous Karthigai Deepam festival is held here, a 10 foot tall lamp is lit at the top of the Arunachala hill",
			"Arni silk production",
			"Largest Rice producers",
			"Pilgrims come here to do a 14 km walk around the Arunachala hill, a practice called Girivalam",
			"Arunachaleswara temple, its huge eastern Gopuram is 217 feet tall,  built by Emporer Krishna Deva Raya in 1516",
			"Sathanur Dam is located here, with its popular crocodile park and fish farms",
		],
		Tiruvallur=[
			'p:Sarvepalli Radhakrishnan, the Second President of India, was born here in Tiruttani.',
			'Pulicat town found at the tip of Pulicat Lake',
			'Casuarinas',
			'c:Tiruttani Murgan temple - Aadi Krittikai - kavadis',
			'Very industrialized district manufacturing everything from cycles, tanks to trains'],
		Thoothukudi=[
			'District was created in 1986 from eastern part of Tirunelveli district',
			'p:Shiv Nadar, Founder of the IT Giant HCL Technologies was born here',
			"h:Korkai located here, was ancient pearl port and capital of the Pandya Kings before they moved to Madurai",
			"f:the famous Kovilpatti Kadalai Mittai a groundnut and jaggery candy",
			"ISRO is building its new space port here at Kulasekharapatnam ",
			"Known in the past as the Pearl Fishery Coast", 
			"p:Veerapandiya Kattabomman",
			"p:great poet Subramanya Bharathi",
			"p:V.O.Chidambaram Pillai Swadeshi Steamship Company",
			"dugong sea grass medows"],
		Tiruppur=[
			'District was created in 2007 from east part of Coimbatore District',
			"Hosiery products. Famously called the Baniyan City or Dollar City for its textile exports", 
			"Half of Indias knitwear, innerwear exports to global brand names comes from here employing more than a 11 lak people",
			"Coins from 2000 years ago found here in Kodumanal, indicate cotton trade route with Rome"],
		Tirupathur=[
			'Vermiculite deposits and mining. The mineral is used in insulators, ceramics and agriculure',
			'The Vainu Bappu Observatory one of the main centers of Indian Astronomy',
			'Surrounded by the Javadhu and Yelagiri Hills known for rivers, waterfalls and sandal wood trees'
			],
		Tiruchirapalli=[
			'Birth place of Suppandi, Hero of Tinkle Comics',
			'f:The famous Imam Pasand Mangos of Thathachariar Gardens in Srirangam',
			'p:C V Raman was born here, the first Asian to win the Nobel Prize in Physics, to answer the question if a glass of water is transparent why is the sea blue?',
			'p:Ramanuja and the Bhakti movement. His mummified body preserved in Ranganthaswamy temple srirangam',
			'c:The Srirangam temple complex covers 156 acres making it the largest templex complex in the country. Famous for festivals conducted throughout the year', 
			'Kallanai also known as the Grand Anicut across the Cauvery river is the oldest dam in the country that is still in use. Built nearly 2000 years ago.',
			'c:Rockfort Temple'],
		Tenkasi=[
			'm:Sunflower fields of Sundarapandipuram village shot to fame after films like Roja and Aniyan were shot here', 
			'Courtallam Falls - locals believe bathing under these waterfalls cures many ailments as the water passes through herbal forests',
			"Known as the Kashi (Varanasi) of the South, its surrounded by the western ghats on three sides and is famous for its monsoon showers, known as Saaral season",
		],	
		Vilippuram=[
			'p:Sivaji Ganesan, an Icon of Tamil Cinema was born here',
			'Along with Cuddalore this District was created from break up of South Arcot in 1993',
			"Surrounds the union teritory of Pondicherry",
			"h:National Fossil Wood Park at Tiruvakkarai has fossilized trees that are nillions of years old",
			"h:Gingee Fort is found here. Sivaji called it the most impregnable fortress in India"
		],
		Virudhunagar=[
			'District was carved out of Ramanathapuram district in 1985 along with Sivagangai',
			'f:Srivilliputtur Palkova, a sweet made from cow milk and sugar',
			"p:Birth place of K. Kamaraj TN CM from 54-63, and Indian National Congress President after Jawaharlal Nehru's death. He made education free for the poor having had to drop out of school at age 11 to support his family",
			'Sivakasi Fireworks',
			'p:R G Chandramogan, founder of Arun IceCream and Hatsun Group, one of the largest private diary groups in the country',
			'c:The 192 ft Gopuram of the Srivilliputhur Temple built here, dedicated to Andal the only woman among the poet saints of south india, is the symbol of the Tamil Nadu Govt'
		],
		Vellore=[
			'Ranipet district was formed from eastern parts of this district in 2019',
			'Along with Tiruvannamalai this district was created from breakup of North Arcot in 1989',
			"Top exporter of finished Leather goods in the country accounting for 37% of Indian leather exports",
			"h:500 year old Vellore Fort is a popular tourist attraction. Was location of the 1806 Sepoy Mutiny against the British"
		]
	}

signal quest_over;	
signal off_track;
signal on_track;
signal show_neighbours;
signal subject_quests_ready;

func sea():
	var a:AnimatedTexture = AnimatedTexture.new()
	a.frames=10
	a.fps=2
	for i in range(1,11):
		a.set_frame_texture(i-1, load("res://pics/sea_"+str(i)+".jpg"))
	#var cnt=11
	#for i in range(10, 1, -1):
	#	a.set_frame_texture(cnt, load("res://sea_"+str(i)+".png"))
	#	cnt=cnt+1
	return a

func panther():
	var a:AnimatedTexture = AnimatedTexture.new()
	a.frames=6
	a.fps=2
	for i in range(1,7):
		a.set_frame_texture(i-1, load("res://pics/panther_"+str(i)+".jpg"))
	return a

var dummyimg=[]

func preload_from_pics_dir():
	var ts = OS.get_ticks_usec()
	var path = "res://pics"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		#elif !file_name.begins_with(".") and !file_name.ends_with(".import"):
		elif file_name.ends_with(".import"):
			#var img=load(path + "/" + file_name)
			# as per godotengine.org/qa/59637/
			# use resourceloader.load instead of load so web build is able to locate right file
			var img = ResourceLoader.load(path+"/" + file_name.replace('.import',''))
			dummyimg.append(img)
	dir.list_dir_end()
	var te = OS.get_ticks_usec()
	print('image loading took: ', te - ts, 'us')

func image_selector(district='', fact=''):
	# if fact has image return that image
	# elif district has image
	# else return random image
	return dummyimg[int(rand_range(0, dummyimg.size()))]

var filterfacts={}
# Called when the node enters the scene tree for the first time.
func _ready():
	#if OS.get_name()=='Android':
	#	$VBoxContainer2/FactBox.set("custom_fonts/font/size",24)
	rect_position.x=-rect_size.x
	var fact_stats={tot=0}
	preload_from_pics_dir()
	# facts have to be filtered by type to setup subject quests/multiquests
	# stored in filterfacts. On new subject quest facts points at relevant filterfacts
	for i in facts:
		#print(i, ' ', len(facts[i]) )
		for f in facts[i]:
			fact_stats['tot']+=1
			if f[1]==':':
				if f[0] in fact_stats:
					fact_stats[f[0]]+=1
					if i in filterfacts[f[0]]:
						filterfacts[f[0]][i].append(f)
					else:
						filterfacts[f[0]][i]=[f]
				else:
					fact_stats[f[0]]=1
					filterfacts[f[0]]={i:[f]}
	print(fact_stats)
	emit_signal('subject_quests_ready',filterfacts)
#	for i in ftype2district:
#		print(i)
#		for j in ftype2district[i]:
#			print('  ',j)	
	hide()# Replace with function body.

var n=[]
var historytext:=''
enum state{
	NEW_QUEST,
	IN_QUEST,
	NON_QUEST
}
var rng=RandomNumberGenerator.new()
var targets=[]
export var NumberOfTargets:=10
export var AttemptsAllowed:=20
var attempts:=AttemptsAllowed
var backupfacts
#generic_quest is true facts is not filtered by type eg people, food etc
#if false facts is stored in backuofacts and is reset with ftype
var generic_quest=true

func clear_infobox_cities():
	for k in $VBoxContainer/PanelContainer.get_children():
		if k is Polygon2D:
			k.hide() #TODO this doesnt really redraw empty poly
		elif k is TextureRect:
			k.show()
		else:
			k.free()	

func reload(district, neighbours, hist='',mode=state.NON_QUEST,ftype=''):
	show()
	#if !(district is Array):
	#	if district == '':
	#		pass
	#	else:
	#		district=district
	historytext=hist
	n=neighbours
	$MarginContainer/Neighbours.pressed=false
	clear_infobox_cities()
	randomize()
	#$VBoxContainer/PanelContainer/imgbox.texture=image_selector(district)
	if mode==state.NEW_QUEST:
		$VBoxContainer/NameBox.text="New Quest!"
		#rng.randomize()
		if district is Array:
			#method used for subject quests ie districts related to a subject are set as targets
			if district.size() > NumberOfTargets:
				targets=district.slice(0, NumberOfTargets-1)
			else:
				NumberOfTargets=district.size()
				targets=district 
			if ftype!='':
				backupfacts=facts
				facts=filterfacts[ftype]
				generic_quest=false
		else:
			# non multi quest ie intiated from Quest button rather than levelup
			while targets.size() != NumberOfTargets:
				rng.randomize()	
				var idx=rng.randi_range(0, facts.size()-1)
				if (facts.keys()[idx] in targets) == false:
					targets.append(facts.keys()[idx])
			
		print('targets set', targets)
		$MarginContainer/clue.show()
		_on_clue_pressed() # to reset info box
	elif mode==state.IN_QUEST:
		attempts=attempts-1
		if targets.size() == 0: #handles case where user might cause a reload after quest is complete
			return
		if targets[0] == district:
			targets.pop_front()
			$VBoxContainer/NameBox.text="Solved:"+str(NumberOfTargets-targets.size())+'/'+str(NumberOfTargets)+" Turns:"+str(AttemptsAllowed-attempts)+'/'+str(AttemptsAllowed)
			#print('targets left', targets)
			_on_clue_pressed("Well done. You are on track!!!\n\n")
			emit_signal("on_track", district)
		else:
			$VBoxContainer/NameBox.text="Solved:"+str(NumberOfTargets-targets.size())+'/'+str(NumberOfTargets)+" Turns:"+str(AttemptsAllowed-attempts)+'/'+str(AttemptsAllowed)#district
			show_fact(district, 'Oops! Wrong direction. You are in '+district+' known for ')
			emit_signal("off_track",district)
		if attempts==0 or targets.size()==0:
			$MarginContainer/clue.hide()
			# this updates state in main TN node and in Qmenu Node. Qmenu will change quest buttons state on quest success
			emit_signal('quest_over',AttemptsAllowed-attempts, NumberOfTargets - targets.size(), targets.size()==0) 
			attempts=AttemptsAllowed
			targets.clear()
			if not generic_quest: #reset facts
				facts=backupfacts
				generic_quest=true
	else:
		#$MarginContainer/clue.hide()
		$VBoxContainer/NameBox.text=district
		show_fact(district)

func show_fact(district, prefix=''):
	if district in facts and facts[district].size() > 0:
		#var idx=rng.randi_range(0, facts[district].size()-1)
		var idx=cycleclues(district)
		$VBoxContainer2/FactBox.text=prefix+strip_metadata(facts[district][idx])
		$VBoxContainer/PanelContainer/imgbox.texture=image_selector(district)
	else:
		#district or fact is missing from the db
		$VBoxContainer2/FactBox.text=''

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_BACKSPACE:
			hide()

signal infobox_exit;
func _on_Back_pressed():
	emit_signal('infobox_exit')

func format_neighbours():
	var textstr=''
	for s in range(0, n.size(),2):
		if s+1 < n.size():
			if s+1 == n.size() -1:
				textstr=textstr+' '+n[s]+' '+n[s+1]
			else:
				textstr=textstr+' '+n[s]+' '+n[s+1]+'\n'
		else:	
			textstr=textstr+' '+n[s]
	return textstr

func _on_Neighbours_pressed():
	if n == null:
		$MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$MarginContainer/Neighbours.pressed=false
		return
	$VBoxContainer2/FactBox.text=format_neighbours()

var cluecache={}
func cycleclues(f):
	if f in cluecache:
		cluecache[f]+=1 
		return cluecache[f] % facts[f].size()
	else:
		randomize()
		facts[f].shuffle()		
		cluecache[f]=0
		return 0

func strip_metadata(cluestr:String):
	if cluestr[1]==':':
		return cluestr.substr(2 )
	else:
		return cluestr

func _on_clue_pressed(prefix=''):
	if targets.size() >0:
		#var idx= rng.randi_range(0, facts[targets[0]].size()-1)
		var idx=cycleclues(targets[0])
		$VBoxContainer/PanelContainer/imgbox.texture=image_selector(targets[0]) 
		#print(idx, cluecache)
		$VBoxContainer2/FactBox.text=prefix+'Head to the district known for - \n'+strip_metadata(facts[targets[0]][idx])
	
func _on_history_pressed():
	if historytext==null or historytext=="":
		return
	$VBoxContainer2/FactBox.text=historytext

func _on_Neighbours_toggled(button_pressed):
	if n == null:
		$MarginContainer/Neighbours.pressed=false
		return
	if len(n) == 0:
		$MarginContainer/Neighbours.pressed=false
		return
	emit_signal('show_neighbours', button_pressed)

signal show_munis

func _on_Muni_toggled(button_pressed):
	if button_pressed:
		emit_signal('show_munis',$VBoxContainer/NameBox.text)
	else:
		clear_infobox_cities()
