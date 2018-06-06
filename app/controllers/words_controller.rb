class WordsController < ApplicationController

  def generate_ipsum
    words = [ 
      "4 wheeler", "18 wheeler", "ain't", "Alabama", "amen", "America", "ammo",
      "angler", "antelope", "antlers", "AR-15", "Arkansas", "army", "ATV", 
      
      "bacon", "Bama", "baptist", "baseball", "bait", "banjo", "barbecue", "barb wire", "bayou", 
      "beer", "beer pong", "belt buckle", "bluegrass", "bolo tie",
      "bonfire", "boot camp", "boots", "booze", "bourbon", "bow hunting", "Boy Scouts", "brambles", 
      "britches", "bronco", "buck",
      "buckskin", "Budweiser", "bull", "bull horns", "bullets", "bumpkin", "burgers", "by God", 
      
      "cactus", "Camaro", "camo", "camouflage", "camper", "camping", "Carhartts", "Carolina", "castrate", "catfish",
      "cattle", "CB radio", "chainsaw", "chaps", "Chevy", "chew", "chickens", "chum", "church", "community college", 
      "conservative",
      "coon", "Coors", "Copenhagen", "corral", "Corvette", "cotton", "country", "cow", "cowboy", "cracker", "crawdad",
      
      "dang", "darn", "deer", "deet", "deliverance", "dern", "diesel", "dip", "dirt road", "Dale Earnhardt",
      "dirt bikes", "Dixie", "dog", "double-barrel", "double wide", "Dr Pepper", "dually truck", "duck huntin",
      "dune buggy", 
      
      "eagle", "elbow grease", "elk", "estrus", 
      
      "farm", "fence", "fiddle", "firewood", "fireworks", "fishin", "fishin pole", "fixin", "fixin", "flag", "flatbed",
      "Florida", "folks", "football", "Ford", "foreman", "Fox News",
      
      "gambler", "gander", "garden", "gasoline", "gator", "gelding", "George Strait", "Georgia", "Glock", "goose", "gosh", "gospel", 
      "grandpa", "granny", "gravy", "grits", "grizzly", "gumbo", "guns", 
      "gussied up", "gut",
      
      "ham radio", "hard hat", "henhouse", "herd", "hick", "hillbilly", "hogs", "holler", "holster", "honky", "honky-tonk", "horse", 
      "horseshoe", "horsepower", "hotdog", "hotrod", "hound dog", "howdy", "huntin", "hymnal", 
      
      "inbred",
      
      "jackrabbit", "jackknife", "Jeep", "jambalaya", "job site", "John Deere", "jukebox",
      
      "keg", "Kentucky", "kerosine", "ketchup", "kin", "kinfolk", "knee-high", "knife", "knuckle",
      
      "lift kit", "lightning bugs", "Louisiana", "LSU", "Lucky Strikes", "lunchbox", "lures", 
      
      "mag", "mare", "Marine Corps", "Marlboro" "mayonnaise", "McRib", "Michelob", "Mississippi", "moonshine", 
      "Mtn Dew", "muddin", "muffler", "muscle car", "Mustang",
      
      "NASCAR", "National Anthem", "noodlin", "NRA",
      
      "oak tree", "oil change", "Oklahoma", "Old Glory", "ornery", "outhouse", "oxy",
      
      "Pepsi", "pew", "pickup", "piddly", "plantation", "pony", "pork chops", "possum", "post-hole digger",  
      "potato salad", "preacher", "prepper", "propane", 
      
      "quarterback", "quarter mile",
      
      "racecar", "rager", "ranch", "rattler", "Reba", "rebel", "reckon", "redneck", "red white and blue", "reel", "Remington",
      "republican", "reverend", "rifle", "riverboat", "rod", "rodeo", "roll tide",
      "rooster", "Ruger", "rural", "rut", 
      
      "saddle", "sammich", "sausage", "savannah", "shotgun", "shootin", "silencer", "sinker", "six pack",
      "skedaddle", "skeeter", "Skoal", "slaughter", "Smith & Wesson", "smoked", "snapping turtle", "Southern",
      "sow", "spark plug", "spitter", "spurs", "station wagon", "steak", "steel-toed", "steer",
      "Stetson", "supper", "swamp", "sweet tea", 
      
      "tackle", "tackle box", "tater", "Tennessee", "Texas", "throttle", "ticks", "tractor", "tradition", 
      "trailer", "train", "transmission", "trolling", "turkey", 
      
      "uncle", "USA", 
      
      "values", "varmint", "veterans", "VFW", 
      
      "waders", "wagon", "wagonwheel", "welder", "western", "whiskey", "white lightning", "white trash", "Winchester", "work",
      
      "y'all", "yankee", "yeehaw", "you betcha"]
    
    sentence_len1 = rand(5...20)
    ran_words1 = words.sample(sentence_len1).map(&:inspect).join(' ')
    sentence_len2 = rand(5...20)
    ran_words2 = words.sample(sentence_len2).map(&:inspect).join(' ')
    sentence_len3 = rand(5...20)
    ran_words3 = words.sample(sentence_len3).map(&:inspect).join(' ')
    
    @generated = "The " + ran_words1.delete('"') + ". " + "A " + ran_words2.delete('"') + ". " + "Some " + ran_words3.delete('"') + "."
    
  end
end