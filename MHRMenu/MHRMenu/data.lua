
log.info("[MHR Menu] Data loaded");

-------------------
-- MHR Menu Data --
-------------------

--< SINGLETONS >--

local DataManager

--< END SINGLETONS >--

--< REFERENCE DEFINITION >--

local Settings

local Math
local Table

--< END REFERENCE DEFINITION >--

--< MODULE DEFINITION >--

local Data = {}

Data.Enum = {}
Data.Dictionary = {}

--< ENUM >--

Data.Enum.WeaponTypes = {
    GreatSword = 0,
    Hammer = 1,
    Lance = 2,
    ShortSword = 3,
    LightBowgun = 4,
    HeavyBowgun = 5,
    DualBlades = 6,
    LongSword = 7,
    Horn = 8,
    GunLance = 9,
    Bow = 10,
    SlashAxe = 11,
    ChargeAxe = 12,
    InsectGlaive = 13,
    Insect = 14
}

Data.Enum.Element = {
    None = 0,
    Fire = 1,
    Water = 2,
    Thunder = 3,
    Ice = 4,
    Dragon = 5,
    Posion = 6,
    Sleep = 7,
    Paralyze = 8,
    Bomb = 9,
    Max = 10,
    Error = 11
}

--< END ENUM >--

--< DICTIONARY >--

Data.Dictionary.Element = {
    [1] = "None",
    [2] = "Fire",
    [3] = "Water",
    [4] = "Thunder",
    [5] = "Ice",
    [6] = "Dragon",
    [7] = "Posion",
    [8] = "Sleep",
    [9] = "Paralyze",
    [10] = "Bomb",
    [11] = "Max",
    [12] = "Error"
}

-- < MINIFIED (https://goonlinetools.com/lua-minifier/) (https://goonlinetools.com/lua-beautifier/) >--

-- Weapon Model IDs
Data.Dictionary.ModelID={}Data.Dictionary.ModelID.GreatSword={[1]={name="G_Swd001",id=135266304},[2]={name="G_Swd002",id=135266305},[3]={name="G_Swd003",id=135266306},[4]={name="G_Swd004",id=135266307},[5]={name="G_Swd005",id=135266308},[6]={name="G_Swd006",id=135266309},[7]={name="G_Swd007",id=135266310},[8]={name="G_Swd008",id=135266311},[9]={name="G_Swd009",id=135266312},[10]={name="G_Swd010",id=135266313},[11]={name="G_Swd011",id=135266314},[12]={name="G_Swd012",id=135266315},[13]={name="G_Swd013",id=135266316},[14]={name="G_Swd014",id=135266317},[15]={name="G_Swd015",id=135266318},[16]={name="G_Swd016",id=135266319},[17]={name="G_Swd017",id=135266320},[18]={name="G_Swd018",id=135266321},[19]={name="G_Swd019",id=135266322},[20]={name="G_Swd020",id=135266323},[21]={name="G_Swd021",id=135266324},[22]={name="G_Swd022",id=135266325},[23]={name="G_Swd023",id=135266326},[24]={name="G_Swd024",id=135266327},[25]={name="G_Swd025",id=135266328},[26]={name="G_Swd026",id=135266329},[27]={name="G_Swd027",id=135266330},[28]={name="G_Swd028",id=135266331},[29]={name="G_Swd029",id=135266332},[30]={name="G_Swd030",id=135266333},[31]={name="G_Swd031",id=135266334},[32]={name="G_Swd032",id=135266335},[33]={name="G_Swd033",id=135266336},[34]={name="G_Swd034",id=135266337},[35]={name="G_Swd035",id=135266338},[36]={name="G_Swd036",id=135266339},[37]={name="G_Swd037",id=135266340},[38]={name="G_Swd038",id=135266341},[39]={name="G_Swd039",id=135266342},[40]={name="G_Swd040",id=135266343},[41]={name="G_Swd041",id=135266344},[42]={name="G_Swd042",id=135266345},[43]={name="G_Swd043",id=135266346},[44]={name="G_Swd044",id=135266347},[45]={name="G_Swd045",id=135266348},[46]={name="G_Swd046",id=135266349},[47]={name="G_Swd047",id=135266350}}Data.Dictionary.ModelID._GreatSword={}Data.Dictionary.ModelID.LongSword={[1]={name="L_Swd001",id=139460608},[2]={name="L_Swd002",id=139460609},[3]={name="L_Swd003",id=139460610},[4]={name="L_Swd004",id=139460611},[5]={name="L_Swd005",id=139460612},[6]={name="L_Swd006",id=139460613},[7]={name="L_Swd007",id=139460614},[8]={name="L_Swd008",id=139460615},[9]={name="L_Swd009",id=139460616},[10]={name="L_Swd010",id=139460617},[11]={name="L_Swd011",id=139460618},[12]={name="L_Swd012",id=139460619},[13]={name="L_Swd013",id=139460620},[14]={name="L_Swd014",id=139460621},[15]={name="L_Swd015",id=139460622},[16]={name="L_Swd016",id=139460623},[17]={name="L_Swd017",id=139460624},[18]={name="L_Swd018",id=139460625},[19]={name="L_Swd019",id=139460626},[20]={name="L_Swd020",id=139460627},[21]={name="L_Swd021",id=139460628},[22]={name="L_Swd022",id=139460629},[23]={name="L_Swd023",id=139460630},[24]={name="L_Swd024",id=139460631},[25]={name="L_Swd025",id=139460632},[26]={name="L_Swd026",id=139460633},[27]={name="L_Swd027",id=139460634},[28]={name="L_Swd028",id=139460635},[29]={name="L_Swd029",id=139460636},[30]={name="L_Swd030",id=139460637},[31]={name="L_Swd031",id=139460638},[32]={name="L_Swd032",id=139460639},[33]={name="L_Swd033",id=139460640},[34]={name="L_Swd034",id=139460641},[35]={name="L_Swd035",id=139460642},[36]={name="L_Swd036",id=139460643},[37]={name="L_Swd037",id=139460644},[38]={name="L_Swd038",id=139460645},[39]={name="L_Swd039",id=139460646},[40]={name="L_Swd040",id=139460647},[41]={name="L_Swd041",id=139460648},[42]={name="L_Swd042",id=139460649},[43]={name="L_Swd043",id=139460650},[44]={name="L_Swd044",id=139460651},[45]={name="L_Swd045",id=139460652},[46]={name="L_Swd046",id=139460653},[47]={name="L_Swd047",id=139460654},[48]={name="L_Swd048",id=139460655}}Data.Dictionary.ModelID._LongSword={}Data.Dictionary.ModelID.Lance={[1]={name="Lan001",id=138412032},[2]={name="Lan002",id=138412033},[3]={name="Lan003",id=138412034},[4]={name="Lan004",id=138412035},[5]={name="Lan005",id=138412036},[6]={name="Lan006",id=138412037},[7]={name="Lan007",id=138412038},[8]={name="Lan008",id=138412039},[9]={name="Lan009",id=138412040},[10]={name="Lan010",id=138412041},[11]={name="Lan011",id=138412042},[12]={name="Lan012",id=138412043},[13]={name="Lan013",id=138412044},[14]={name="Lan014",id=138412045},[15]={name="Lan015",id=138412046},[16]={name="Lan016",id=138412047},[17]={name="Lan017",id=138412048},[18]={name="Lan018",id=138412049},[19]={name="Lan019",id=138412050},[20]={name="Lan020",id=138412051},[21]={name="Lan021",id=138412052},[22]={name="Lan022",id=138412053},[23]={name="Lan023",id=138412054},[24]={name="Lan024",id=138412055},[25]={name="Lan025",id=138412056},[26]={name="Lan026",id=138412057},[27]={name="Lan027",id=138412058},[28]={name="Lan028",id=138412059},[29]={name="Lan029",id=138412060},[30]={name="Lan030",id=138412061},[31]={name="Lan031",id=138412062},[32]={name="Lan032",id=138412063},[33]={name="Lan033",id=138412064},[34]={name="Lan034",id=138412065},[35]={name="Lan035",id=138412066},[36]={name="Lan036",id=138412067},[37]={name="Lan037",id=138412068},[38]={name="Lan038",id=138412069},[39]={name="Lan039",id=138412070},[40]={name="Lan040",id=138412071},[41]={name="Lan041",id=138412072},[42]={name="Lan042",id=138412073},[43]={name="Lan043",id=138412074},[44]={name="Lan044",id=138412075},[45]={name="Lan045",id=138412076}}Data.Dictionary.ModelID._Lance={}Data.Dictionary.ModelID.GunLance={[1]={name="G_Lan001",id=141557760},[2]={name="G_Lan002",id=141557761},[3]={name="G_Lan003",id=141557762},[4]={name="G_Lan004",id=141557763},[5]={name="G_Lan005",id=141557764},[6]={name="G_Lan006",id=141557765},[7]={name="G_Lan007",id=141557766},[8]={name="G_Lan008",id=141557767},[9]={name="G_Lan009",id=141557768},[10]={name="G_Lan010",id=141557769},[11]={name="G_Lan011",id=141557770},[12]={name="G_Lan012",id=141557771},[13]={name="G_Lan013",id=141557772},[14]={name="G_Lan014",id=141557773},[15]={name="G_Lan015",id=141557774},[16]={name="G_Lan016",id=141557775},[17]={name="G_Lan017",id=141557776},[18]={name="G_Lan018",id=141557777},[19]={name="G_Lan019",id=141557778},[20]={name="G_Lan020",id=141557779},[21]={name="G_Lan021",id=141557780},[22]={name="G_Lan022",id=141557781},[23]={name="G_Lan023",id=141557782},[24]={name="G_Lan024",id=141557783},[25]={name="G_Lan025",id=141557784},[26]={name="G_Lan026",id=141557785},[27]={name="G_Lan027",id=141557786},[28]={name="G_Lan028",id=141557787},[29]={name="G_Lan029",id=141557788},[30]={name="G_Lan030",id=141557789},[31]={name="G_Lan031",id=141557790},[32]={name="G_Lan032",id=141557791},[33]={name="G_Lan033",id=141557792},[34]={name="G_Lan034",id=141557793},[35]={name="G_Lan035",id=141557794},[36]={name="G_Lan036",id=141557795},[37]={name="G_Lan037",id=141557796},[38]={name="G_Lan038",id=141557797},[39]={name="G_Lan039",id=141557798},[40]={name="G_Lan040",id=141557799},[41]={name="G_Lan041",id=141557800},[42]={name="G_Lan042",id=141557801},[43]={name="G_Lan043",id=141557802},[44]={name="G_Lan044",id=141557803}}Data.Dictionary.ModelID._GunLance={}Data.Dictionary.ModelID.ShortSword={[1]={name="S_Swd001",id=136314880},[2]={name="S_Swd002",id=136314881},[3]={name="S_Swd003",id=136314882},[4]={name="S_Swd004",id=136314883},[5]={name="S_Swd005",id=136314884},[6]={name="S_Swd006",id=136314885},[7]={name="S_Swd007",id=136314886},[8]={name="S_Swd008",id=136314887},[9]={name="S_Swd009",id=136314888},[10]={name="S_Swd010",id=136314889},[11]={name="S_Swd011",id=136314890},[12]={name="S_Swd012",id=136314891},[13]={name="S_Swd013",id=136314892},[14]={name="S_Swd014",id=136314893},[15]={name="S_Swd015",id=136314894},[16]={name="S_Swd016",id=136314895},[17]={name="S_Swd017",id=136314896},[18]={name="S_Swd018",id=136314897},[19]={name="S_Swd019",id=136314898},[20]={name="S_Swd020",id=136314899},[21]={name="S_Swd021",id=136314900},[22]={name="S_Swd022",id=136314901},[23]={name="S_Swd023",id=136314902},[24]={name="S_Swd024",id=136314903},[25]={name="S_Swd025",id=136314904},[26]={name="S_Swd026",id=136314905},[27]={name="S_Swd027",id=136314906},[28]={name="S_Swd028",id=136314907},[29]={name="S_Swd029",id=136314908},[30]={name="S_Swd030",id=136314909},[31]={name="S_Swd031",id=136314910},[32]={name="S_Swd032",id=136314911},[33]={name="S_Swd033",id=136314912},[34]={name="S_Swd034",id=136314913},[35]={name="S_Swd035",id=136314914},[36]={name="S_Swd036",id=136314915},[37]={name="S_Swd037",id=136314916},[38]={name="S_Swd038",id=136314917},[39]={name="S_Swd039",id=136314918},[40]={name="S_Swd040",id=136314919},[41]={name="S_Swd041",id=136314920},[42]={name="S_Swd042",id=136314921},[43]={name="S_Swd043",id=136314922},[44]={name="S_Swd044",id=136314923},[45]={name="S_Swd045",id=136314924},[46]={name="S_Swd046",id=136314925},[47]={name="S_Swd047",id=136314926},[48]={name="S_Swd048",id=136314927},[49]={name="S_Swd049",id=136314928}}Data.Dictionary.ModelID._ShortSword={}Data.Dictionary.ModelID.DualBlades={[1]={name="D_Bld001",id=142606336},[2]={name="D_Bld002",id=142606337},[3]={name="D_Bld003",id=142606338},[4]={name="D_Bld004",id=142606339},[5]={name="D_Bld005",id=142606340},[6]={name="D_Bld006",id=142606341},[7]={name="D_Bld007",id=142606342},[8]={name="D_Bld008",id=142606343},[9]={name="D_Bld009",id=142606344},[10]={name="D_Bld010",id=142606345},[11]={name="D_Bld011",id=142606346},[12]={name="D_Bld012",id=142606347},[13]={name="D_Bld013",id=142606348},[14]={name="D_Bld014",id=142606349},[15]={name="D_Bld015",id=142606350},[16]={name="D_Bld016",id=142606351},[17]={name="D_Bld017",id=142606352},[18]={name="D_Bld018",id=142606353},[19]={name="D_Bld019",id=142606354},[20]={name="D_Bld020",id=142606355},[21]={name="D_Bld021",id=142606356},[22]={name="D_Bld022",id=142606357},[23]={name="D_Bld023",id=142606358},[24]={name="D_Bld024",id=142606359},[25]={name="D_Bld025",id=142606360},[26]={name="D_Bld026",id=142606361},[27]={name="D_Bld027",id=142606362},[28]={name="D_Bld028",id=142606363},[29]={name="D_Bld029",id=142606364},[30]={name="D_Bld030",id=142606365},[31]={name="D_Bld031",id=142606366},[32]={name="D_Bld032",id=142606367},[33]={name="D_Bld033",id=142606368},[34]={name="D_Bld034",id=142606369},[35]={name="D_Bld035",id=142606370},[36]={name="D_Bld036",id=142606371},[37]={name="D_Bld037",id=142606372},[38]={name="D_Bld038",id=142606373},[39]={name="D_Bld039",id=142606374},[40]={name="D_Bld040",id=142606375},[41]={name="D_Bld041",id=142606376},[42]={name="D_Bld042",id=142606377},[43]={name="D_Bld043",id=142606378},[44]={name="D_Bld044",id=142606379},[45]={name="D_Bld045",id=142606380}}Data.Dictionary.ModelID._DualBlades={}Data.Dictionary.ModelID.Hammer={[1]={name="Ham001",id=137363456},[2]={name="Ham002",id=137363457},[3]={name="Ham003",id=137363458},[4]={name="Ham004",id=137363459},[5]={name="Ham005",id=137363460},[6]={name="Ham006",id=137363461},[7]={name="Ham007",id=137363462},[8]={name="Ham008",id=137363463},[9]={name="Ham009",id=137363464},[10]={name="Ham010",id=137363465},[11]={name="Ham011",id=137363466},[12]={name="Ham012",id=137363467},[13]={name="Ham013",id=137363468},[14]={name="Ham014",id=137363469},[15]={name="Ham015",id=137363470},[16]={name="Ham016",id=137363471},[17]={name="Ham017",id=137363472},[18]={name="Ham018",id=137363473},[19]={name="Ham019",id=137363474},[20]={name="Ham020",id=137363475},[21]={name="Ham021",id=137363476},[22]={name="Ham022",id=137363477},[23]={name="Ham023",id=137363478},[24]={name="Ham024",id=137363479},[25]={name="Ham025",id=137363480},[26]={name="Ham026",id=137363481},[27]={name="Ham027",id=137363482},[28]={name="Ham028",id=137363483},[29]={name="Ham029",id=137363484},[30]={name="Ham030",id=137363485},[31]={name="Ham031",id=137363486},[32]={name="Ham032",id=137363487},[33]={name="Ham033",id=137363488},[34]={name="Ham034",id=137363489},[35]={name="Ham035",id=137363490},[36]={name="Ham036",id=137363491},[37]={name="Ham037",id=137363492},[38]={name="Ham038",id=137363493},[39]={name="Ham039",id=137363494},[40]={name="Ham040",id=137363495},[41]={name="Ham041",id=137363496},[42]={name="Ham042",id=137363497},[43]={name="Ham043",id=137363498},[44]={name="Ham044",id=137363499},[45]={name="Ham045",id=137363500},[46]={name="Ham046",id=137363501},[47]={name="Ham047",id=137363502},[48]={name="Ham048",id=137363503}}Data.Dictionary.ModelID._Hammer={}Data.Dictionary.ModelID.Horn={[1]={name="Hrn001",id=143654912},[2]={name="Hrn002",id=143654913},[3]={name="Hrn003",id=143654914},[4]={name="Hrn004",id=143654915},[5]={name="Hrn005",id=143654916},[6]={name="Hrn006",id=143654917},[7]={name="Hrn007",id=143654918},[8]={name="Hrn008",id=143654919},[9]={name="Hrn009",id=143654920},[10]={name="Hrn010",id=143654921},[11]={name="Hrn011",id=143654922},[12]={name="Hrn012",id=143654923},[13]={name="Hrn013",id=143654924},[14]={name="Hrn014",id=143654925},[15]={name="Hrn015",id=143654926},[16]={name="Hrn016",id=143654927},[17]={name="Hrn017",id=143654928},[18]={name="Hrn018",id=143654929},[19]={name="Hrn019",id=143654930},[20]={name="Hrn020",id=143654931},[21]={name="Hrn021",id=143654932},[22]={name="Hrn022",id=143654933},[23]={name="Hrn023",id=143654934},[24]={name="Hrn024",id=143654935},[25]={name="Hrn025",id=143654936},[26]={name="Hrn026",id=143654937},[27]={name="Hrn027",id=143654938},[28]={name="Hrn028",id=143654939},[29]={name="Hrn029",id=143654940},[30]={name="Hrn030",id=143654941},[31]={name="Hrn031",id=143654942},[32]={name="Hrn032",id=143654943},[33]={name="Hrn033",id=143654944},[34]={name="Hrn034",id=143654945},[35]={name="Hrn035",id=143654946},[36]={name="Hrn036",id=143654947},[37]={name="Hrn037",id=143654948},[38]={name="Hrn038",id=143654949},[39]={name="Hrn039",id=143654950},[40]={name="Hrn040",id=143654951},[41]={name="Hrn041",id=143654952},[42]={name="Hrn042",id=143654953},[43]={name="Hrn043",id=143654954},[44]={name="Hrn044",id=143654955},[45]={name="Hrn045",id=143654956},[46]={name="Hrn046",id=143654957}}Data.Dictionary.ModelID._Horn={}Data.Dictionary.ModelID.SlashAxe={[1]={name="S_Axe001",id=140509184},[2]={name="S_Axe002",id=140509185},[3]={name="S_Axe003",id=140509186},[4]={name="S_Axe004",id=140509187},[5]={name="S_Axe005",id=140509188},[6]={name="S_Axe006",id=140509189},[7]={name="S_Axe007",id=140509190},[8]={name="S_Axe008",id=140509191},[9]={name="S_Axe009",id=140509192},[10]={name="S_Axe010",id=140509193},[11]={name="S_Axe011",id=140509194},[12]={name="S_Axe012",id=140509195},[13]={name="S_Axe013",id=140509196},[14]={name="S_Axe014",id=140509197},[15]={name="S_Axe015",id=140509198},[16]={name="S_Axe016",id=140509199},[17]={name="S_Axe017",id=140509200},[18]={name="S_Axe018",id=140509201},[19]={name="S_Axe019",id=140509202},[20]={name="S_Axe020",id=140509203},[21]={name="S_Axe021",id=140509204},[22]={name="S_Axe022",id=140509205},[23]={name="S_Axe023",id=140509206},[24]={name="S_Axe024",id=140509207},[25]={name="S_Axe025",id=140509208},[26]={name="S_Axe026",id=140509209},[27]={name="S_Axe027",id=140509210},[28]={name="S_Axe028",id=140509211},[29]={name="S_Axe029",id=140509212},[30]={name="S_Axe030",id=140509213},[31]={name="S_Axe031",id=140509214},[32]={name="S_Axe032",id=140509215},[33]={name="S_Axe033",id=140509216},[34]={name="S_Axe034",id=140509217},[35]={name="S_Axe035",id=140509218},[36]={name="S_Axe036",id=140509219},[37]={name="S_Axe037",id=140509220},[38]={name="S_Axe038",id=140509221},[39]={name="S_Axe039",id=140509222},[40]={name="S_Axe040",id=140509223},[41]={name="S_Axe041",id=140509224},[42]={name="S_Axe042",id=140509225},[43]={name="S_Axe043",id=140509226},[44]={name="S_Axe044",id=140509227},[45]={name="S_Axe045",id=140509228}}Data.Dictionary.ModelID._SlashAxe={}Data.Dictionary.ModelID.ChargeAxe={[1]={name="C_Axe001",id=145752064},[2]={name="C_Axe002",id=145752065},[3]={name="C_Axe003",id=145752066},[4]={name="C_Axe004",id=145752067},[5]={name="C_Axe005",id=145752068},[6]={name="C_Axe006",id=145752069},[7]={name="C_Axe007",id=145752070},[8]={name="C_Axe008",id=145752071},[9]={name="C_Axe009",id=145752072},[10]={name="C_Axe010",id=145752073},[11]={name="C_Axe011",id=145752074},[12]={name="C_Axe012",id=145752075},[13]={name="C_Axe013",id=145752076},[14]={name="C_Axe014",id=145752077},[15]={name="C_Axe015",id=145752078},[16]={name="C_Axe016",id=145752079},[17]={name="C_Axe017",id=145752080},[18]={name="C_Axe018",id=145752081},[19]={name="C_Axe019",id=145752082},[20]={name="C_Axe020",id=145752083},[21]={name="C_Axe021",id=145752084},[22]={name="C_Axe022",id=145752085},[23]={name="C_Axe023",id=145752086},[24]={name="C_Axe024",id=145752087},[25]={name="C_Axe025",id=145752088},[26]={name="C_Axe026",id=145752089},[27]={name="C_Axe027",id=145752090},[28]={name="C_Axe028",id=145752091},[29]={name="C_Axe029",id=145752092},[30]={name="C_Axe030",id=145752093},[31]={name="C_Axe031",id=145752094},[32]={name="C_Axe032",id=145752095},[33]={name="C_Axe033",id=145752096},[34]={name="C_Axe034",id=145752097},[35]={name="C_Axe035",id=145752098},[36]={name="C_Axe036",id=145752099},[37]={name="C_Axe037",id=145752100},[38]={name="C_Axe038",id=145752101},[39]={name="C_Axe039",id=145752102},[40]={name="C_Axe040",id=145752103}}Data.Dictionary.ModelID._ChargeAxe={}Data.Dictionary.ModelID.InsectGlaive={[1]={name="I_Gla001",id=144703488},[2]={name="I_Gla002",id=144703489},[3]={name="I_Gla003",id=144703490},[4]={name="I_Gla004",id=144703491},[5]={name="I_Gla005",id=144703492},[6]={name="I_Gla006",id=144703493},[7]={name="I_Gla007",id=144703494},[8]={name="I_Gla008",id=144703495},[9]={name="I_Gla009",id=144703496},[10]={name="I_Gla010",id=144703497},[11]={name="I_Gla011",id=144703498},[12]={name="I_Gla012",id=144703499},[13]={name="I_Gla013",id=144703500},[14]={name="I_Gla014",id=144703501},[15]={name="I_Gla015",id=144703502},[16]={name="I_Gla016",id=144703503},[17]={name="I_Gla017",id=144703504},[18]={name="I_Gla018",id=144703505},[19]={name="I_Gla019",id=144703506},[20]={name="I_Gla020",id=144703507},[21]={name="I_Gla021",id=144703508},[22]={name="I_Gla022",id=144703509},[23]={name="I_Gla023",id=144703510},[24]={name="I_Gla024",id=144703511},[25]={name="I_Gla025",id=144703512},[26]={name="I_Gla026",id=144703513},[27]={name="I_Gla027",id=144703514},[28]={name="I_Gla028",id=144703515},[29]={name="I_Gla029",id=144703516},[30]={name="I_Gla030",id=144703517},[31]={name="I_Gla031",id=144703518},[32]={name="I_Gla032",id=144703519},[33]={name="I_Gla033",id=144703520},[34]={name="I_Gla034",id=144703521},[35]={name="I_Gla035",id=144703522},[36]={name="I_Gla036",id=144703523},[37]={name="I_Gla037",id=144703524},[38]={name="I_Gla038",id=144703525},[39]={name="I_Gla039",id=144703526},[40]={name="I_Gla040",id=144703527},[41]={name="I_Gla041",id=144703528},[42]={name="I_Gla042",id=144703529},[43]={name="I_Gla043",id=144703530}}Data.Dictionary.ModelID._InsectGlaive={}Data.Dictionary.ModelID.LightBowgun={[1]={name="L_Bg001",id=146800640},[2]={name="L_Bg002",id=146800641},[3]={name="L_Bg003",id=146800642},[4]={name="L_Bg004",id=146800643},[5]={name="L_Bg005",id=146800644},[6]={name="L_Bg006",id=146800645},[7]={name="L_Bg007",id=146800646},[8]={name="L_Bg008",id=146800647},[9]={name="L_Bg009",id=146800648},[10]={name="L_Bg010",id=146800649},[11]={name="L_Bg011",id=146800650},[12]={name="L_Bg012",id=146800651},[13]={name="L_Bg013",id=146800652},[14]={name="L_Bg014",id=146800653},[15]={name="L_Bg015",id=146800654},[16]={name="L_Bg016",id=146800655},[17]={name="L_Bg017",id=146800656},[18]={name="L_Bg018",id=146800657},[19]={name="L_Bg019",id=146800658},[20]={name="L_Bg020",id=146800659},[21]={name="L_Bg021",id=146800660},[22]={name="L_Bg022",id=146800661},[23]={name="L_Bg023",id=146800662},[24]={name="L_Bg024",id=146800663},[25]={name="L_Bg025",id=146800664},[26]={name="L_Bg026",id=146800665},[27]={name="L_Bg027",id=146800666},[28]={name="L_Bg028",id=146800667},[29]={name="L_Bg029",id=146800668},[30]={name="L_Bg030",id=146800669},[31]={name="L_Bg031",id=146800670},[32]={name="L_Bg032",id=146800671},[33]={name="L_Bg033",id=146800672},[34]={name="L_Bg034",id=146800673},[35]={name="L_Bg035",id=146800674},[36]={name="L_Bg036",id=146800675},[37]={name="L_Bg037",id=146800676},[38]={name="L_Bg038",id=146800677}}Data.Dictionary.ModelID._LightBowgun={}Data.Dictionary.ModelID.HeavyBowgun={[1]={name="H_Bg001",id=147849216},[2]={name="H_Bg002",id=147849217},[3]={name="H_Bg003",id=147849218},[4]={name="H_Bg004",id=147849219},[5]={name="H_Bg005",id=147849220},[6]={name="H_Bg006",id=147849221},[7]={name="H_Bg007",id=147849222},[8]={name="H_Bg008",id=147849223},[9]={name="H_Bg009",id=147849224},[10]={name="H_Bg010",id=147849225},[11]={name="H_Bg011",id=147849226},[12]={name="H_Bg012",id=147849227},[13]={name="H_Bg013",id=147849228},[14]={name="H_Bg014",id=147849229},[15]={name="H_Bg015",id=147849230},[16]={name="H_Bg016",id=147849231},[17]={name="H_Bg017",id=147849232},[18]={name="H_Bg018",id=147849233},[19]={name="H_Bg019",id=147849234},[20]={name="H_Bg020",id=147849235},[21]={name="H_Bg021",id=147849236},[22]={name="H_Bg022",id=147849237},[23]={name="H_Bg023",id=147849238},[24]={name="H_Bg024",id=147849239},[25]={name="H_Bg025",id=147849240},[26]={name="H_Bg026",id=147849241},[27]={name="H_Bg027",id=147849242},[28]={name="H_Bg028",id=147849243},[29]={name="H_Bg029",id=147849244},[30]={name="H_Bg030",id=147849245},[31]={name="H_Bg031",id=147849246},[32]={name="H_Bg032",id=147849247},[33]={name="H_Bg033",id=147849248},[34]={name="H_Bg034",id=147849249},[35]={name="H_Bg035",id=147849250},[36]={name="H_Bg036",id=147849251},[37]={name="H_Bg037",id=147849252},[38]={name="H_Bg038",id=147849253},[39]={name="H_Bg039",id=147849254},[40]={name="H_Bg040",id=147849255}}Data.Dictionary.ModelID._HeavyBowgun={}Data.Dictionary.ModelID.Bow={[1]={name="Bow001",id=148897792},[2]={name="Bow002",id=148897793},[3]={name="Bow003",id=148897794},[4]={name="Bow004",id=148897795},[5]={name="Bow005",id=148897796},[6]={name="Bow006",id=148897797},[7]={name="Bow007",id=148897798},[8]={name="Bow008",id=148897799},[9]={name="Bow009",id=148897800},[10]={name="Bow010",id=148897801},[11]={name="Bow011",id=148897802},[12]={name="Bow012",id=148897803},[13]={name="Bow013",id=148897804},[14]={name="Bow014",id=148897805},[15]={name="Bow015",id=148897806},[16]={name="Bow016",id=148897807},[17]={name="Bow017",id=148897808},[18]={name="Bow018",id=148897809},[19]={name="Bow019",id=148897810},[20]={name="Bow020",id=148897811},[21]={name="Bow021",id=148897812},[22]={name="Bow022",id=148897813},[23]={name="Bow023",id=148897814},[24]={name="Bow024",id=148897815},[25]={name="Bow025",id=148897816},[26]={name="Bow026",id=148897817},[27]={name="Bow027",id=148897818},[28]={name="Bow028",id=148897819},[29]={name="Bow029",id=148897820},[30]={name="Bow030",id=148897821},[31]={name="Bow031",id=148897822},[32]={name="Bow032",id=148897823},[33]={name="Bow033",id=148897824},[34]={name="Bow034",id=148897825},[35]={name="Bow035",id=148897826},[36]={name="Bow036",id=148897827},[37]={name="Bow037",id=148897828},[38]={name="Bow038",id=148897829},[39]={name="Bow039",id=148897830},[40]={name="Bow040",id=148897831},[41]={name="Bow041",id=148897832},[42]={name="Bow042",id=148897833},[43]={name="Bow043",id=148897834},[44]={name="Bow044",id=148897835},[45]={name="Bow045",id=148897836},[46]={name="Bow046",id=148897837},[47]={name="Bow047",id=148897838},[48]={name="Bow048",id=148897839},[49]={name="Bow049",id=148897840}}Data.Dictionary.ModelID._Bow={}Data.Dictionary.ModelID.Insect={[1]={name="IG_Ins001",id=149946368},[2]={name="IG_Ins002",id=149946369},[3]={name="IG_Ins003",id=149946370},[4]={name="IG_Ins004",id=149946371},[5]={name="IG_Ins005",id=149946372},[6]={name="IG_Ins006",id=149946373},[7]={name="IG_Ins007",id=149946374},[8]={name="IG_Ins008",id=149946375},[9]={name="IG_Ins009",id=149946376},[10]={name="IG_Ins010",id=149946377},[11]={name="IG_Ins011",id=149946378},[12]={name="IG_Ins012",id=149946379},[13]={name="IG_Ins013",id=149946380},[14]={name="IG_Ins014",id=149946381},[15]={name="IG_Ins015",id=149946382},[16]={name="IG_Ins016",id=149946383},[17]={name="IG_Ins017",id=149946384},[18]={name="IG_Ins018",id=149946385},[19]={name="IG_Ins019",id=149946386},[20]={name="IG_Ins020",id=149946387},[21]={name="IG_Ins021",id=149946388},[22]={name="IG_Ins022",id=149946389}}Data.Dictionary.ModelID._Insect={}

--< END MINIFIED >--

--< END DICTIONARY >--

function Data.Initialize()
    DataManager = require("MHRMenu.singletons.DataManager")

    Settings = require("MHRMenu.settings")
    Math = require("MHRMenu.helpers.math")
    Table = require("MHRMenu.helpers.table")

    Table.ForEach(Data.Dictionary.ModelID.GreatSword, function(key, value)
        table.insert(Data.Dictionary.ModelID._GreatSword, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.LongSword, function(key, value)
        table.insert(Data.Dictionary.ModelID._LongSword, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.Lance, function(key, value)
        table.insert(Data.Dictionary.ModelID._Lance, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.GunLance, function(key, value)
        table.insert(Data.Dictionary.ModelID._GunLance, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.ShortSword, function(key, value)
        table.insert(Data.Dictionary.ModelID._ShortSword, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.DualBlades, function(key, value)
        table.insert(Data.Dictionary.ModelID._DualBlades, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.Hammer, function(key, value)
        table.insert(Data.Dictionary.ModelID._Hammer, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.Horn, function(key, value)
        table.insert(Data.Dictionary.ModelID._Horn, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.SlashAxe, function(key, value)
        table.insert(Data.Dictionary.ModelID._SlashAxe, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.ChargeAxe, function(key, value)
        table.insert(Data.Dictionary.ModelID._ChargeAxe, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.InsectGlaive, function(key, value)
        table.insert(Data.Dictionary.ModelID._InsectGlaive, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.LightBowgun, function(key, value)
        table.insert(Data.Dictionary.ModelID._LightBowgun, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.HeavyBowgun, function(key, value)
        table.insert(Data.Dictionary.ModelID._HeavyBowgun, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.Bow, function(key, value)
        table.insert(Data.Dictionary.ModelID._Bow, value.name)
    end)

    Table.ForEach(Data.Dictionary.ModelID.Insect, function(key, value)
        table.insert(Data.Dictionary.ModelID._Insect, value.name)
    end)
end

function Data.Update()
    if not Settings.Config.ItemBox.itemcount_cap_max_toggle and not Settings.Config.ItemBox.itemcount_cap_min_toggle then return end

    local itembox = DataManager.f_ItemBox()
    if not itembox then return end

    local inventorylist = DataManager.ItemBox.f_InventoryList(itembox)
    if not inventorylist then return end

    local size = DataManager.InventoryList.f_Size(inventorylist)

    for index = 0, (size - 1) do
        local iteminventorydata = DataManager.ItemInventoryData.GetFromCollection(inventorylist, index)
        if not iteminventorydata then goto continue end

        local count = DataManager.ItemInventoryData.f_Num(iteminventorydata)
        if count <= 0 then goto continue end

        if Settings.Config.ItemBox.itemcount_cap_max_toggle and count > Settings.Config.ItemBox.itemcount_cap_max_value then
            DataManager.ItemInventoryData.f_Num(iteminventorydata, Settings.Config.ItemBox.itemcount_cap_max_value)
        end

        if Settings.Config.ItemBox.itemcount_cap_min_toggle and count < Settings.Config.ItemBox.itemcount_cap_min_value then
            DataManager.ItemInventoryData.f_Num(iteminventorydata, Settings.Config.ItemBox.itemcount_cap_min_value)
        end

        ::continue::
    end
end

return Data

--< END MODULE DEFINITION >--