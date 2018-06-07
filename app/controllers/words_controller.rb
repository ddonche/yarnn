class WordsController < ApplicationController

  def generate_ipsum
    words = [ 
      "2nd Amendment", "4-wheeler", "18-wheeler", "afterburner", "ain't", "Alabama", "alligator", "amen", "America", "ammo", "ammunition",
      "angler", "antelope", "antlers", "ape drape", "Appalachian", "AR-15", "Arkansas", "army", "ATV", 
      
      "backhoe", "backwoods", "bacon", "Bama", "baptist", "baseball", "bait", "banjo", "barbecue", "barb wire", "bayou", 
      "beer", "beer pong", "belt buckle", "big-block", "bless her heart", "bluegrass", "bolo tie", "bolt action",
      "bonfire", "boot camp", "boots", "booze", "Boss 302", "bourbon", "bow hunting", "Boy Scouts", "brambles", "breech-loaded",
      "britches", "bronco", "buck",
      "buckskin", "Budweiser", "bull", "bull horns", "bullets", "bumpkin", "burgers", "burn rubber", "butter", "by God", 
      
      "cactus", "Cajun", "caliber", "Camaro", "camo", "camouflage", "camper", "camping", "carburetor", "Carhartts", 
      "Carolina", "cartridge", "castrate", "catfish",
      "cattle", "CB radio", "center mass", "chainsaw", "chamber", "chaps", "Charlotte", "Chevy", "chew", "chickens", "chiggers",
      "Christian", "chuckwagon", "chum", "church",
      "clodhopper", "clutch", "coal mine", "Coke", "cole slaw", "collard greens", "community college", "confederate", 
      "conniption", "conservative", "Constitution",
      "coon", "Coors", "Copenhagen", "copperhead", "cornbread", "corral", "Corvette", "cotton", "cottonmouth", "country", "cow", 
      "cowboy", "cracker", "crawdad",
      "creek", "Creole", "cross", "Cuda",
      
      "daddy", "dang", "darn", "deer", "deet", "deliverance", "dentures", "deputy", "dern", "diamonback", 
      "diddly squat", "diesel", "dip", "dirt road", "Dale Earnhardt",
      "dirt bikes", "Dixie", "dog", "double-barrel", "double wide", "Dr Pepper", "dually truck", "duck huntin",
      "dump truck", "dune buggy", 
      
      "eagle", "elbow grease", "elk", "Elvis", "estrus", 
      
      "farm", "fence", "fiddle", "Firebird", "firewood", "fireworks", "firing pin", "fishin", "fishin pole", "fixin", "fixin", "flag", "flatbed",
      "Florida", "folks", "football", "Ford", "foreman", "Fox News", "front porch", "full metal jacket",
      
      "gambler", "gander", "garden", "gasoline", "gator", "gelding", "George Strait", "Georgia", "gizzard", "glasspack", "Glock", 
      "goose", "gosh", "gospel", 
      "Graceland", "grandpa", "granny", "gravy", "grits", "grizzly", "GTO Judge", "gumbo", "guns", 
      "gussied up", "gut",
      
      "ham radio", "hard hat", "Harley-Davidson", "hay", "heaven", "hell", "Hemi", "henhouse", "herd", "hick", "hillbilly", "hissy fit", "hogs", 
      "holler", "holster", "honky", "honky-tonk", "hood scoop", "hornet", "horse", 
      "horseshoe", "horsepower", "hotdog", "hotrod", "hound dog", "howdy", "huntin", "hushpuppy", "hymnal", 
      
      "inbred", "iron sights",
      
      "Jack Daniels", "jackrabbit", "jackknife", "jaw", "Jeep", "jambalaya", "Jesus", "job site", "John Deere", "John Wayne", "jukebox",
      
      "keg", "Kentucky", "kerosine", "ketchup", "kin", "kinfolk", "knee-high", "knife", "knuckle",
      
      "lever action", "lift kit", "lightning bugs", "Louisiana", "LSU", "Lucky Strikes", "lug nuts", "lunchbox", "lures", 
      
      "mag", "magazine", "magnum", "mama", "mare", "Marine Corps", "Marlboro" "mayonnaise", "McRib", "Memphis", "Michelob", "Mississippi", 
      "molasses", "moonshine", 
      "Mtn Dew", "muddin", "muffler", "mullet", "muscle car", "Mustang",
      
      "NASCAR", "Nashville", "National Anthem", "naw", "noodlin", "NRA",
      
      "oak tree", "oil change", "Oklahoma", "okra", "Old Glory", "ornery", "outhouse", "overalls", "oxy", "Ozarks",
      
      "pace car", "pardner", "passel", "Pepsi", "pew", "pickup", "piddly", "pit crew", "plantation", "plumb", "polecat", 
      "pony", "ponycar", "pork chops", "possum", "post-hole digger",  
      "potato salad", "preacher", "prepper", "primer", "propane", "pump action",
      
      "quarterback", "quarter mile",
      
      "racecar", "ragamuffin", "rager", "ranch", "rascal", "rattler", "Reagan", "Reba", "rebel", "reckon", "recollection", 
      "redneck", "red white and blue", "reel", "reload", "Remington",
      "republican", "restrictor plate", "reverend", "revolver", "rifle", "rimfire", "riverboat", "rockin chair", "rod", 
      "rodeo", "roll tide",
      "rooster", "roustabout", "Ruger", "rural", "rut", 
      
      "saddle", "sammich", "sausage", "savannah", "scope", "scrambled eggs", "sermon", "shaker", "sheriff", 
      "shifter", "shotgun", "shootin", "sideburns", "silencer", "sinker", 
      "sinner", "six pack",
      "skedaddle", "skeeter", "Skoal", "slaughter", "slingshot", "slop", "small-block", "Smith & Wesson", "smoked", "smoothbore", 
      "snapping turtle", "Southern",
      "sow", "spark plug", "spitter", "spoiler", "spurs", "station wagon", "steak", "steel-toed", "steer",
      "Stetson", "succotash", "supercharged", "supper", "swamp", "sweet tea", 
      
      "tackle", "tackle box", "tarnation", "tater", "Tennessee", "Texas", "these parts", "throttle", "ticks",
      "torque", "tractor", "tradition", 
      "trailer", "train", "Trans-Am", "transmission", "trigger", "trolling", "tuckered", "turkey", "turnip greens",
      
      "uncle", "USA", 
      
      "values", "varmint", "veterans", "VFW", "Virginia",
      
      "waders", "wadn't", "wagon", "wagonwheel", "welder", "western", "West Virginia", "whiskey", "white lightning", "white trash", "whittle", 
      "Winchester", "work",
      
      "y'all", "yankee", "yeehaw", "yellow jacket", "yonder", "you betcha", 
      
      "Z-28"]
    
    sentence_len1 = rand(5...20)
    ran_words1 = words.sample(sentence_len1).map(&:inspect).join(' ')
    sentence_len2 = rand(5...20)
    ran_words2 = words.sample(sentence_len2).map(&:inspect).join(' ')
    sentence_len3 = rand(5...20)
    ran_words3 = words.sample(sentence_len3).map(&:inspect).join(' ')
    
    @generated = "The " + ran_words1.delete('"') + ". " + "A " + ran_words2.delete('"') + ". " + "Some " + ran_words3.delete('"') + "."
    
  end
end