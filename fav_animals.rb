favourite_animals = {}

while true
  print "Name an animal you like: "
  animal = gets.chomp.to_s
  
  print "What do you like about them: "
  reason = gets.chomp.to_s

  print "Can you get this animal as a pet? (y/n): "
  can_own = gets.chomp.to_s == "y"

  favourite_animals[animal] = Hash.new
  
  favourite_animals[animal]["reason"] = reason
  favourite_animals[animal]["can_own"] = can_own

  print "Do you have any other animals you like? (y/n): "
  if gets.chomp == "n"
    break
  end
end
p favourite_animals
favourite_animals.each do |animal, bio|
  puts "You like #{animal} because #{bio['reason']} and you #{bio[can_own] ? "can" : "can't have one as a pet!"}"
end
